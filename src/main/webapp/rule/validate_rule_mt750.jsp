<%-- 
    Document   : mt750
    Created on : Aug 8, 2018
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
                _020_mf21_related_reference: "required",

                //mf32b
                _030_mf32b_currency_principal_amount: "required",
                _031_mf32b_amount: "required",
                
                //mf77j
                _100_mf77j_discrepancies: "required",
                
                //of34b
                total_amount_paid_checkbox: {
                    required: function(element) {
                      return ($("#_040_of33b_currency_additional_amount").val() != "" && $("#_041_of33b_amount").val() != "")
                             || ($("#_050_of71d_charges_deducated").val() != "") 
                             || ($("#_060_of73a_charges_added").val() != "");
                    }
                },

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_mf32b_currency_principal_amount: {required: "mf32b_currency_principal_amount harus diisi..!!"},
                _031_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _100_mf77j_discrepancies: {required: "mf77j_discrepancies harus diisi..!!"},
                total_amount_paid_checkbox: {required: "of34b harus diisi jika of33b atau of71d atau of73a diisi..!!"},
                
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
        
        //OF33B_check
        $("#check_of33b").hide();
        $("#_040_of33b_currency_additional_amount").attr("disabled", true);
        $("#_041_of33b_amount").attr("disabled", true);
        $("#additional_amount_checkbox").click(function(){
            if ($("#additional_amount_checkbox").is(":checked")){
                $("#check_of33b").show();
                $("#_040_of33b_currency_additional_amount").attr("disabled", false);
                $("#_041_of33b_amount").attr("disabled", false);
            } else {
                $("#check_of33b").hide();
                $("#_040_of33b_currency_additional_amount").attr("disabled", true);
                $("#_041_of33b_amount").attr("disabled", true);
            }
        });
        
        //OF34B_check
        $("#check_of34b").hide();
        $("#_070_of34b_currency_total_amount_paid").attr("disabled", true);
        $("#_071_of34b_amount").attr("disabled", true);
        $("#total_amount_paid_checkbox").click(function(){
            if ($("#total_amount_paid_checkbox").is(":checked")){
                $("#check_of34b").show();
                $("#_070_of34b_currency_total_amount_paid").attr("disabled", false);
                $("#_071_of34b_amount").attr("disabled", false);
            } else {
                $("#check_of34b").hide();
                $("#_070_of34b_currency_total_amount_paid").attr("disabled", true);
                $("#_071_of34b_amount").attr("disabled", true);
            }
        });

        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_080_of57a_party_identifier").attr("disabled", true);
        $("#_081_of57a_identifier_code").attr("disabled", true);
        $("#_082_of57b_party_identifier").attr("disabled", true);
        $("#_083_of57b_location").attr("disabled", true);
        $("#_084_of57d_party_identifier").attr("disabled", true);
        $("#_085_of57d_name_address").attr("disabled", true);
        $("#type_of57_account_with_bank").change(function() {
            if ( $("#type_of57_account_with_bank").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_080_of57a_party_identifier").attr("disabled", false);
                $("#_081_of57a_identifier_code").attr("disabled", false);
                $("#_082_of57b_party_identifier").attr("disabled", true);
                $("#_083_of57b_location").attr("disabled", true);
                $("#_084_of57d_party_identifier").attr("disabled", true);
                $("#_085_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_080_of57a_party_identifier").attr("disabled", true);
                $("#_081_of57a_identifier_code").attr("disabled", true);
                $("#_082_of57b_party_identifier").attr("disabled", false);
                $("#_083_of57b_location").attr("disabled", false);
                $("#_084_of57d_party_identifier").attr("disabled", true);
                $("#_085_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_account_with_bank").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_080_of57a_party_identifier").attr("disabled", true);
                $("#_081_of57a_identifier_code").attr("disabled", true);
                $("#_082_of57b_party_identifier").attr("disabled", true);
                $("#_083_of57b_location").attr("disabled", true);
                $("#_084_of57d_party_identifier").attr("disabled", false);
                $("#_085_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_080_of57a_party_identifier").attr("disabled", true);
                $("#_081_of57a_identifier_code").attr("disabled", true);
                $("#_082_of57b_party_identifier").attr("disabled", true);
                $("#_083_of57b_location").attr("disabled", true);
                $("#_084_of57d_party_identifier").attr("disabled", true);
                $("#_085_of57d_name_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF33B_check
        if ($("#_040_of33b_currency_additional_amount").val() != "" || $("#_041_of33b_amount").val() != ""){
            $("#additional_amount_checkbox").attr("checked", true);
            $("#check_of33b").show();
            $("#_040_of33b_currency_additional_amount").attr("disabled", false);
            $("#_041_of33b_amount").attr("disabled", false);
        } else {
            $("#check_of33b").hide();
            $("#_040_of33b_currency_additional_amount").attr("disabled", true);
            $("#_041_of33b_amount").attr("disabled", true);
        }
        
        //OF34B_check
        if ($("#_070_of34b_currency_total_amount_paid").val() != "" || $("#_071_of34b_amount").val() != ""){
            $("#total_amount_paid_checkbox").attr("checked", true);
            $("#check_of34b").show();
            $("#_070_of34b_currency_total_amount_paid").attr("disabled", false);
            $("#_071_of34b_amount").attr("disabled", false);
        } else {
            $("#check_of34b").hide();
            $("#_070_of34b_currency_total_amount_paid").attr("disabled", true);
            $("#_071_of34b_amount").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_080_of57a_party_identifier").val() != "" || $("#_081_of57a_identifier_code").val() != ""){
            $("#type_of57_account_with_bank").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_080_of57a_party_identifier").attr("disabled", false);
            $("#_081_of57a_identifier_code").attr("disabled", false);
            $("#_082_of57b_party_identifier").attr("disabled", true);
            $("#_083_of57b_location").attr("disabled", true);
            $("#_084_of57d_party_identifier").attr("disabled", true);
            $("#_085_of57d_name_address").attr("disabled", true);
        } else if ($("#_082_of57b_party_identifier").val() != "" || $("#_083_of57b_location").val() != ""){
            $("#type_of57_account_with_bank").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_080_of57a_party_identifier").attr("disabled", true);
            $("#_081_of57a_identifier_code").attr("disabled", true);
            $("#_082_of57b_party_identifier").attr("disabled", false);
            $("#_083_of57b_location").attr("disabled", false);
            $("#_084_of57d_party_identifier").attr("disabled", true);
            $("#_085_of57d_name_address").attr("disabled", true);
        } else if ($("#_084_of57d_party_identifier").val() != "" || $("#_085_of57d_name_address").val() != ""){
            $("#type_of57_account_with_bank").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_080_of57a_party_identifier").attr("disabled", true);
            $("#_081_of57a_identifier_code").attr("disabled", true);
            $("#_082_of57b_party_identifier").attr("disabled", true);
            $("#_083_of57b_location").attr("disabled", true);
            $("#_084_of57d_party_identifier").attr("disabled", false);
            $("#_085_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_080_of57a_party_identifier").attr("disabled", true);
            $("#_081_of57a_identifier_code").attr("disabled", true);
            $("#_082_of57b_party_identifier").attr("disabled", true);
            $("#_083_of57b_location").attr("disabled", true);
            $("#_084_of57d_party_identifier").attr("disabled", true);
            $("#_085_of57d_name_address").attr("disabled", true);
        }
        
    });
</script>