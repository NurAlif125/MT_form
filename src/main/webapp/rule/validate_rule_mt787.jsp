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
                
                //mf52_a_d
                _012_mf52a_party_identifier: "required",
                _013_mf52a_identifier_code: "required",
                _014_mf52d_party_identifier: "required",
                _015_mf52d_name_and_address: "required",
                
                //mf26e
                _017_mf26e_number_of_amendment: "required",
                               

                //mf23r
                _018_mf23r_code: "required",
                _018_mf23r_text: "required",
                
             

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _011_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                
                _012_mf52a_party_identifier: {required: "mf52a_party_identifier harus diisi..!!"},
                _013_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _014_mf52d_party_identifier: {required: "mf52d_party_identifier harus diisi..!!"},
                _015_mf52d_name_and_address: {required: "mf52d_name_and_address harus diisi..!!"},
                
                _017_mf26e_number_of_amendment: {required: "mf26e_number_of_amendment harus diisi..!!"},
                _018_mf23r_code: {required: "mf23r_code harus diisi..!!"},
                _018_mf23r_text: {required: "mf23r_text harus diisi..!!"},

                
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
