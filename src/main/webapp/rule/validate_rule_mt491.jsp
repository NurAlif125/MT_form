<%-- 
    Document   : mt491
    Created on : Aug 20, 2018
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
                _010_mf20_transaction_reference_number: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //mf32b
                _030_mf32b_currency_code: "required",
                _031_mf32b_amount: "required",
                
                //of52
                _041_of52a_identifier_code: "required",
                _043_of52d_name_address: "required",
                
                //of57
                _051_of57a_identifier_code: "required",
                _055_of57d_name_address: "required",
                
                //mf71b
                _060_mf71b_details_charges: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf32b_currency_code: {required: "mf32b_currency_code harus diisi..!!"},
                _031_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _041_of52a_identifier_code: {required: "of52a_identifier_code harus diisi..!!"},
                _043_of52d_name_address: {required: "of52d_name_address harus diisi..!!"},
                _051_of57a_identifier_code: {required: "of57a_identifier_code harus diisi..!!"},
                _055_of57d_name_address: {required: "of57d_name_address harus diisi..!!"},
                _060_mf71b_details_charges: {required: "mf71b_details_charges harus diisi..!!"}
                
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
        
        //OF52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_040_of52a_party_identifier").attr("disabled", true);
        $("#_041_of52a_identifier_code").attr("disabled", true);
        $("#_042_of52d_party_identifier").attr("disabled", true);
        $("#_043_of52d_name_address").attr("disabled", true);
        $("#type_of52_ordering_institution").change(function() {
            if ( $("#type_of52_ordering_institution").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_040_of52a_party_identifier").attr("disabled", false);
                $("#_041_of52a_identifier_code").attr("disabled", false);
                $("#_042_of52d_party_identifier").attr("disabled", true);
                $("#_043_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_ordering_institution").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_040_of52a_party_identifier").attr("disabled", true);
                $("#_041_of52a_identifier_code").attr("disabled", true);
                $("#_042_of52d_party_identifier").attr("disabled", false);
                $("#_043_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_040_of52a_party_identifier").attr("disabled", true);
                $("#_041_of52a_identifier_code").attr("disabled", true);
                $("#_042_of52d_party_identifier").attr("disabled", true);
                $("#_043_of52d_name_address").attr("disabled", true);
            }
        });

        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_050_of57a_party_identifier").attr("disabled", true);
        $("#_051_of57a_identifier_code").attr("disabled", true);
        $("#_052_of57b_party_identifier").attr("disabled", true);
        $("#_053_of57b_location").attr("disabled", true);
        $("#_054_of57d_party_identifier").attr("disabled", true);
        $("#_055_of57d_name_address").attr("disabled", true);
        $("#type_of57_account_with_institution").change(function() {
            if ( $("#type_of57_account_with_institution").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", false);
                $("#_051_of57a_identifier_code").attr("disabled", false);
                $("#_052_of57b_party_identifier").attr("disabled", true);
                $("#_053_of57b_location").attr("disabled", true);
                $("#_054_of57d_party_identifier").attr("disabled", true);
                $("#_055_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_institution").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57b_party_identifier").attr("disabled", false);
                $("#_053_of57b_location").attr("disabled", false);
                $("#_054_of57d_party_identifier").attr("disabled", true);
                $("#_055_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_institution").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57b_party_identifier").attr("disabled", true);
                $("#_053_of57b_location").attr("disabled", true);
                $("#_054_of57d_party_identifier").attr("disabled", false);
                $("#_055_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_050_of57a_party_identifier").attr("disabled", true);
                $("#_051_of57a_identifier_code").attr("disabled", true);
                $("#_052_of57b_party_identifier").attr("disabled", true);
                $("#_053_of57b_location").attr("disabled", true);
                $("#_054_of57d_party_identifier").attr("disabled", true);
                $("#_055_of57d_name_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_040_of52a_party_identifier").val() != "" || $("#_041_of52a_identifier_code").val() != ""){
            $("#type_of52_ordering_institution").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_040_of52a_party_identifier").attr("disabled", false);
            $("#_041_of52a_identifier_code").attr("disabled", false);
            $("#_042_of52d_party_identifier").attr("disabled", true);
            $("#_043_of52d_name_address").attr("disabled", true);
        } else if ($("#_042_of52d_party_identifier").val() != "" || $("#_043_of52d_name_address").val() != ""){
            $("#type_of52_ordering_institution").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_040_of52a_party_identifier").attr("disabled", true);
            $("#_041_of52a_identifier_code").attr("disabled", true);
            $("#_042_of52d_party_identifier").attr("disabled", false);
            $("#_043_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_040_of52a_party_identifier").attr("disabled", true);
            $("#_041_of52a_identifier_code").attr("disabled", true);
            $("#_042_of52d_party_identifier").attr("disabled", true);
            $("#_043_of52d_name_address").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_050_of57a_party_identifier").val() != "" || $("#_051_of57a_identifier_code").val() != ""){
            $("#type_of57_account_with_institution").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", false);
            $("#_051_of57a_identifier_code").attr("disabled", false);
            $("#_052_of57b_party_identifier").attr("disabled", true);
            $("#_053_of57b_location").attr("disabled", true);
            $("#_054_of57d_party_identifier").attr("disabled", true);
            $("#_055_of57d_name_address").attr("disabled", true);
        } else if ($("#_052_of57b_party_identifier").val() != "" || $("#_053_of57b_location").val() != ""){
            $("#type_of57_account_with_institution").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57b_party_identifier").attr("disabled", false);
            $("#_053_of57b_location").attr("disabled", false);
            $("#_054_of57d_party_identifier").attr("disabled", true);
            $("#_055_of57d_name_address").attr("disabled", true);
        } else if ($("#_054_of57d_party_identifier").val() != "" || $("#_055_of57d_name_address").val() != ""){
            $("#type_of57_account_with_institution").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57b_party_identifier").attr("disabled", true);
            $("#_053_of57b_location").attr("disabled", true);
            $("#_054_of57d_party_identifier").attr("disabled", false);
            $("#_055_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_050_of57a_party_identifier").attr("disabled", true);
            $("#_051_of57a_identifier_code").attr("disabled", true);
            $("#_052_of57b_party_identifier").attr("disabled", true);
            $("#_053_of57b_location").attr("disabled", true);
            $("#_054_of57d_party_identifier").attr("disabled", true);
            $("#_055_of57d_name_address").attr("disabled", true);
        } 
    });
</script>