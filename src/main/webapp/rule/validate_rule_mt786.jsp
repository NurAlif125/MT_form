<%-- 
    Document   : validate_rule_mt786
    Created on : Feb 26, 2024, 11:28:27 AM
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
                _010_mf20_undertaking_number: "required",
                

                //mf52_a_d
                _012_mf52a_party_identifier: "required",
                _013_mf52a_identifier_code: "required",
                _014_mf52d_party_identifier: "required",
                _015_mf52d_name_and_address: "required",
                
                //mf30
                _016_mf30_demand_submission_date: "required",
                               

                //mf32b
                _017_mf32b_currency: "required",
                _018_mf32b_amount: "required",
                
                 //mf77j
                _020_mf77j_reason_for_refusal: "required",
                               

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_undertaking_number: {required: "mf20_undertaking_number harus diisi..!!"},
               
                
                _012_mf52a_party_identifier: {required: "mf52a_party_identifier harus diisi..!!"},
                _013_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _014_mf52d_party_identifier: {required: "mf52d_party_identifier harus diisi..!!"},
                _015_mf52d_name_and_address: {required: "mf52d_name_and_address harus diisi..!!"},
                
                _016_mf30_demand_submission_date: {required: "mf30_demand_submission_date harus diisi..!!"},
                _017_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _018_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                
                _020_mf77j_reason_for_refusal: {required: "mf77j_reason_for_refusal harus diisi..!!"},


                
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
        
        //OF52_a_d
        $("#div_mf52a_").hide();
        $("#div_mf52d_").hide();
        $("#_012_mf52a_party_identifier").attr("disabled", true);
        $("#_013_mf52a_identifier_code").attr("disabled", true);
        $("#_014_mf52d_party_identifier").attr("disabled", true);
        $("#_015_mf52d_name_and_address").attr("disabled", true);
        $("#type_mf52_issuing_bank").change(function() {
            if ( $("#type_mf52_issuing_bank").val() == "a"){
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_012_mf52a_party_identifier").attr("disabled", false);
                $("#_013_mf52a_identifier_code").attr("disabled", false);
                $("#_014_mf52d_party_identifier").attr("disabled", true);
                $("#_015_mf52d_name_and_address").attr("disabled", true);
            } else if ( $("#type_mf52_issuing_bank").val() == "d"){
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_012_mf52a_party_identifier").attr("disabled", true);
                $("#_013_mf52a_identifier_code").attr("disabled", true);
                $("#_014_mf52d_party_identifier").attr("disabled", false);
                $("#_015_mf52d_name_and_address").attr("disabled", false);
            } else{
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_012_mf52a_party_identifier").attr("disabled", true);
                $("#_013_mf52a_identifier_code").attr("disabled", true);
                $("#_014_mf52d_party_identifier").attr("disabled", true);
                $("#_015_mf52d_name_and_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_012_mf52a_party_identifier").val() != "" || $("#_013_mf52a_identifier_code").val() != ""){
            $("#type_mf52_issuing_bank").val("a").attr("selected",true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_012_mf52a_party_identifier").attr("disabled", false);
            $("#_013_mf52a_identifier_code").attr("disabled", false);
            $("#_014_mf52d_party_identifier").attr("disabled", true);
            $("#_015_mf52d_name_and_address").attr("disabled", true);
        } else if ($("#_014_mf52d_party_identifier").val() != "" || $("#_015_mf52d_name_and_address").val() != ""){
            $("#type_mf52_issuing_bank").val("d").attr("selected",true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_012_mf52a_party_identifier").attr("disabled", true);
            $("#_013_mf52a_identifier_code").attr("disabled", true);
            $("#_014_mf52d_party_identifier").attr("disabled", false);
            $("#_015_mf52d_name_and_address").attr("disabled", false);
        } else{
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_012_mf52a_party_identifier").attr("disabled", true);
            $("#_013_mf52a_identifier_code").attr("disabled", true);
            $("#_014_mf52d_party_identifier").attr("disabled", true);
            $("#_015_mf52d_name_and_address").attr("disabled", true);
        }
    });
</script>

<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_012_mf52a_party_identifier").val() != "" || $("#_013_mf52a_identifier_code").val() != ""){
            $("#type_mf52_issuing_bank").val("a").attr("selected",true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_012_mf52a_party_identifier").attr("disabled", false);
            $("#_013_mf52a_identifier_code").attr("disabled", false);
            $("#_014_mf52d_party_identifier").attr("disabled", true);
            $("#_015_mf52d_name_and_address").attr("disabled", true);
        } else if ($("#_014_mf52d_party_identifier").val() != "" || $("#_015_mf52d_name_and_address").val() != ""){
            $("#type_mf52_issuing_bank").val("d").attr("selected",true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_012_mf52a_party_identifier").attr("disabled", true);
            $("#_013_mf52a_identifier_code").attr("disabled", true);
            $("#_014_mf52d_party_identifier").attr("disabled", false);
            $("#_015_mf52d_name_and_address").attr("disabled", false);
        } else{
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_012_mf52a_party_identifier").attr("disabled", true);
            $("#_013_mf52a_identifier_code").attr("disabled", true);
            $("#_014_mf52d_party_identifier").attr("disabled", true);
            $("#_015_mf52d_name_and_address").attr("disabled", true);
        }
    });
</script>
