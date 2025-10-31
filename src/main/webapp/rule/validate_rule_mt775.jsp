<%-- 
    Document   : validate_rule_mt775
    Created on : Feb 27, 2024, 1:09:29 PM
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

                _010_mf27_number: "required",
                _011_mf27_total: "required",
                _015_mf20_transaction_reference_number: "required",
                _016_mf21_related_reference: "required",
                _017_mf26e_number_of_amendment: "required",
                _018_mf52a_party_identifier: "required",
                _019_mf52a_identifier_code: "required",
                _020_mf52d_party_identifier: "required",
                _021_mf52d_name_and_address: "required",

             

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                
                _015_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _016_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _017_mf26e_number_of_amendment: {required: "mf26e_number_of_amendmen harus diisi..!!"},
                _018_mf52a_party_identifier: {required: "mf52a_party_identifier harus diisi..!!"},
                
                _019_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _020_mf52d_party_identifier: {required: "mf52d_party_identifier harus diisi..!!"},
                _021_mf52d_name_and_address: {required: "mf52d_name_and_address harus diisi..!!"},

                
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
        $("#_018_mf52a_party_identifier").attr("disabled", true);
        $("#_019_mf52a_identifier_code").attr("disabled", true);
        $("#_020_mf52d_party_identifier").attr("disabled", true);
        $("#_021_mf52d_name_and_address").attr("disabled", true);
        $("#type_mf52_issuing_bank").change(function() {
            if ( $("#type_mf52_issuing_bank").val() == "a"){
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_018_mf52a_party_identifier").attr("disabled", false);
                $("#_019_mf52a_identifier_code").attr("disabled", false);
                $("#_020_mf52d_party_identifier").attr("disabled", true);
                $("#_021_mf52d_name_and_address").attr("disabled", true);
            } else if ( $("#type_mf52_issuing_bank").val() == "d"){
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_018_mf52a_party_identifier").attr("disabled", true);
                $("#_019_mf52a_identifier_code").attr("disabled", true);
                $("#_020_mf52d_party_identifier").attr("disabled", false);
                $("#_021_mf52d_name_and_address").attr("disabled", false);
            } else{
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_018_mf52a_party_identifier").attr("disabled", true);
                $("#_019_mf52a_identifier_code").attr("disabled", true);
                $("#_020_mf52d_party_identifier").attr("disabled", true);
                $("#_021_mf52d_name_and_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_018_mf52a_party_identifier").val() != "" || $("#_019_mf52a_identifier_code").val() != ""){
            $("#type_mf52_issuing_bank").val("a").attr("selected",true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_018_mf52a_party_identifier").attr("disabled", false);
            $("#_019_mf52a_identifier_code").attr("disabled", false);
            $("#_020_mf52d_party_identifier").attr("disabled", true);
            $("#_021_mf52d_name_and_address").attr("disabled", true);
        } else if ($("#_020_mf52d_party_identifier").val() != "" || $("#_021_mf52d_name_and_address").val() != ""){
            $("#type_mf52_issuing_bank").val("d").attr("selected",true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_018_mf52a_party_identifier").attr("disabled", true);
            $("#_019_mf52a_identifier_code").attr("disabled", true);
            $("#_020_mf52d_party_identifier").attr("disabled", false);
            $("#_021_mf52d_name_and_address").attr("disabled", false);
        } else{
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_018_mf52a_party_identifier").attr("disabled", true);
            $("#_019_mf52a_identifier_code").attr("disabled", true);
            $("#_020_mf52d_party_identifier").attr("disabled", true);
            $("#_021_mf52d_name_and_address").attr("disabled", true);
        }
    });
</script>
