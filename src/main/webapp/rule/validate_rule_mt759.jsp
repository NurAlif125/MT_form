<%-- 
    Document   : mt759
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
                //mf27
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                
                //mf27
                _020_mf20_transaction_reference_number: "required",

                //mf22d
                _040_mf22d_form_of_undertaking: "required",
                
                //mf23h
                _070_mf23h_function_of_message: "required",
                
                //mf45d
                _080_mf45d_narrative: "required"
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _040_mf22d_form_of_undertaking: {required: "mf22d_form_of_undertaking harus diisi..!!"},
                _070_mf23h_function_of_message: {required: "mf23h_function_of_message harus diisi..!!"},
                _080_mf45d_narrative: {required: "mf45d_narrative harus diisi..!!"}
                
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
        $("#_060_of52a_party_identifier").attr("disabled", true);
        $("#_061_of52a_identifier_code").attr("disabled", true);
        $("#_062_of52d_party_identifier").attr("disabled", true);
        $("#_063_of52d_name_address").attr("disabled", true);
        $("#type_of52_issuer").change(function() {
            if ( $("#type_of52_issuer").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_060_of52a_party_identifier").attr("disabled", false);
                $("#_061_of52a_identifier_code").attr("disabled", false);
                $("#_062_of52d_party_identifier").attr("disabled", true);
                $("#_063_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_issuer").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_062_of52d_party_identifier").attr("disabled", false);
                $("#_063_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_060_of52a_party_identifier").attr("disabled", true);
                $("#_061_of52a_identifier_code").attr("disabled", true);
                $("#_062_of52d_party_identifier").attr("disabled", true);
                $("#_063_of52d_name_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_060_of52a_party_identifier").val() != "" || $("#_061_of52a_identifier_code").val() != ""){
            $("#type_of52_issuer").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_060_of52a_party_identifier").attr("disabled", false);
            $("#_061_of52a_identifier_code").attr("disabled", false);
            $("#_062_of52d_party_identifier").attr("disabled", true);
            $("#_063_of52d_name_address").attr("disabled", true);
        } else if ($("#_062_of52d_party_identifier").val() != "" || $("#_063_of52d_name_address").val() != ""){
            $("#type_of52_issuer").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_062_of52d_party_identifier").attr("disabled", false);
            $("#_063_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_060_of52a_party_identifier").attr("disabled", true);
            $("#_061_of52a_identifier_code").attr("disabled", true);
            $("#_062_of52d_party_identifier").attr("disabled", true);
            $("#_063_of52d_name_address").attr("disabled", true);
        }
    });
</script>