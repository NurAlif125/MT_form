<%-- 
    Document   : validate_rule_mt768
    Created on : Feb 27, 2024, 12:48:16 PM
    Author     : LENOVO
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

                //mf20
                _010_mf20_transaction_reference_number: "required",
                
                //mf21
                _011_mf21_related_reference: "required",
                
                //mf30
                _013_mf30_date_of_massage: "required",
                
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _011_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _013_mf30_date_of_massage: {required: "mf30_date_of_massage harus diisi..!!"},
            },
            errorPlacement: function(error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function(errorMap, errorList) {
                this.defaultShowErrors();            
            }
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function(){
        
        
          //of32_a_d
        $("#div_of32b_").hide();
        $("#div_of32d_").hide();
        $("#_017_of32b_currency").attr("disabled", true);
        $("#_018_of32b_amount").attr("disabled", true);
        $("#_019_of32d_date").attr("disabled", true);
        $("#_020_of32d_currency").attr("disabled", true);
        $("#_020_of32d_amount").attr("disabled", true);
        $("#type_of32a_").change(function() {
            if ( $("#type_of32a_").val() == "b"){
                $("#div_of32b_").show();
                $("#div_of32d_").hide();
                $("#_017_of32b_currency").attr("disabled", false);
                $("#_018_of32b_amount").attr("disabled", false);
                $("#_019_of32d_date").attr("disabled", true);
                $("#_020_of32d_currency").attr("disabled", true);
                $("#_020_of32d_amount").attr("disabled", true);
            } else if ( $("#type_of32a_").val() == "d"){
                $("#div_of32b_").hide();
                $("#div_of32d_").show();
                 $("#_017_of32b_currency").attr("disabled", true);
                $("#_018_of32b_amount").attr("disabled", true);
                $("#_019_of32d_date").attr("disabled", false);
                $("#_020_of32d_currency").attr("disabled", false);
                $("#_020_of32d_amount").attr("disabled", false);
            } else{
                $("#div_of32b_").hide();
                $("#div_of32d_").hide();
                $("#_017_of32b_currency").attr("disabled", true);
                $("#_018_of32b_amount").attr("disabled", true);
                $("#_019_of32d_date").attr("disabled", true);
                $("#_020_of32d_currency").attr("disabled", true);
                $("#_020_of32d_amount").attr("disabled", true);
            }
        });
        
         $("#check_of34b").hide();
        $("#_025_of34b_currency").attr("disabled", true);
        $("#_026_of34b_amount").attr("disabled", true);
        $("#new_credit_amount_after_amendment_checkbox").click(function(){
            if ($("#new_credit_amount_after_amendment_checkbox").is(":checked")){
                $("#check_of34b").show();
                $("#_025_of34b_currency").attr("disabled", false);
                $("#_026_of34b_amount").attr("disabled", false);
            } else {
                $("#check_of34b").hide();
                $("#_025_of34b_currency").attr("disabled", true);
                $("#_026_of34b_amount").attr("disabled", true);
            }
        });
        
        //OF57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_100_of57a_party_identifier").attr("disabled", true);
        $("#_101_of57a_identifier_code").attr("disabled", true);
        $("#_102_of57b_party_identifier").attr("disabled", true);
        $("#_103_of57b_location").attr("disabled", true);
        $("#_104_of57d_party_identifier").attr("disabled", true);
        $("#_105_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_").change(function() {
            if ( $("#type_of57_").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", false);
                $("#_101_of57a_identifier_code").attr("disabled", false);
                $("#_102_of57b_party_identifier").attr("disabled", true);
                $("#_103_of57b_location").attr("disabled", true);
                $("#_104_of57d_party_identifier").attr("disabled", true);
                $("#_105_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_102_of57b_party_identifier").attr("disabled", false);
                $("#_103_of57b_location").attr("disabled", false);
                $("#_104_of57d_party_identifier").attr("disabled", true);
                $("#_105_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_102_of57b_party_identifier").attr("disabled", true);
                $("#_103_of57b_location").attr("disabled", true);
                $("#_104_of57d_party_identifier").attr("disabled", false);
                $("#_105_of57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_102_of57b_party_identifier").attr("disabled", true);
                $("#_103_of57b_location").attr("disabled", true);
                $("#_104_of57d_party_identifier").attr("disabled", true);
                $("#_105_of57d_name_and_address").attr("disabled", true);
            }
        
        });
        
        
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF32_a_d
         if ($("#_017_of32b_currency").val() != "" || $("#_018_of32b_amount").val() != ""){
            $("#type_of32a_").val("b").attr("selected",true);
            $("#div_of32b_").show();
            $("#div_of32d_").hide();
            $("#_017_of32b_currency").attr("disabled", false);
            $("#_018_of32b_amount").attr("disabled", false);
            $("#_019_of32d_date").attr("disabled", true);
            $("#_020_of32d_currency").attr("disabled", true);
            $("#_020_of32d_amount").attr("disabled", true);
        } else if ($("#_019_of32d_date").val() != "" || $("#_020_of32d_currency").val() != "" || $("#_020_of32d_amount").val() != "" ){
            $("#type_of32a_").val("d").attr("selected",true);
            $("#div_of32b_").hide();
            $("#div_of32d_").show();
            $("#_017_of32b_currency").attr("disabled", true);
            $("#_018_of32b_amount").attr("disabled", true);
            $("#_019_of32d_date").attr("disabled", false);
            $("#_020_of32d_currency").attr("disabled", false);
            $("#_020_of32d_amount").attr("disabled", false);
        } else{
            $("#div_of32b_").hide();
            $("#div_of32d_").hide();
            $("#_017_of32b_currency").attr("disabled", true);
            $("#_018_of32b_amount").attr("disabled", true);
            $("#_019_of32d_date").attr("disabled", true);
            $("#_020_of32d_currency").attr("disabled", true);
            $("#_020_of32d_amount").attr("disabled", true);
        }
        
        //OF34B
        if ($("#_025_of34b_currency").val() != "" || $("#_026_of34b_amount").val() != ""){
            $("#new_credit_amount_after_amendment_checkbox").attr("checked", true);
            $("#check_of34b").show();
            $("#_025_of34b_currency").attr("disabled", false);
            $("#_026_of34b_amount").attr("disabled", false);
        } else {
            $("#check_of34b").hide();
            $("#_025_of34b_currency").attr("disabled", true);
            $("#_026_of34b_amount").attr("disabled", true);
        }
        
        //OF57_a_b_d
        if ($("#_100_of57a_party_identifier").val() != "" || $("#_101_of57a_identifier_code").val() != ""){
            $("#type_of57_").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", false);
            $("#_101_of57a_identifier_code").attr("disabled", false);
            $("#_102_of57b_party_identifier").attr("disabled", true);
            $("#_103_of57b_location").attr("disabled", true);
            $("#_104_of57d_party_identifier").attr("disabled", true);
            $("#_105_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_102_of57b_party_identifier").val() != "" || $("#_103_of57b_location").val() != ""){
            $("#type_of57_").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_102_of57b_party_identifier").attr("disabled", false);
            $("#_103_of57b_location").attr("disabled", false);
            $("#_104_of57d_party_identifier").attr("disabled", true);
            $("#_105_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_104_of57d_party_identifier").val() != "" || $("#_105_of57d_name_and_address").val() != ""){
            $("#type_of57_").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_102_of57b_party_identifier").attr("disabled", true);
            $("#_103_of57b_location").attr("disabled", true);
            $("#_104_of57d_party_identifier").attr("disabled", false);
            $("#_105_of57d_name_and_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_102_of57b_party_identifier").attr("disabled", true);
            $("#_103_of57b_location").attr("disabled", true);
            $("#_104_of57d_party_identifier").attr("disabled", true);
            $("#_105_of57d_name_and_address").attr("disabled", true);
        }
        

        
    });
</script>
