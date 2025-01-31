<%-- 
    Document   : validate_rule_mt900
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
--%>

<script type="text/javascript">
    $(document).ready(function () {
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
                _010_mf27_Number: "required",
                _011_mf27_Total: "required",

                //mf20
                _020_mf20_Senders_Reference: "required",

                //mf21
                _030_mf21_Documentary_Credit_Number: "required",

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_Number: {required: "mf27 Number harus diisi..!!"},
                _011_mf27_Total: {required: "mf27 Total harus diisi..!!"},
                _020_mf20_Senders_Reference:{required: "mf20 harus diisi..!!"},
                _030_mf21_Documentary_Credit_Number: {required: "mf21 Documentary Credit Number harus diisi..!!"},
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
                alert(error.html());
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<%--<script type="text/javascript">
    $(document).ready(function(){
        //of52a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_016_of52a_party_identifier").attr("disabled", true);
        $("#_017_of52a_identifier_code").attr("disabled", true);
        $("#_019_of52d_party_identifier").attr("disabled", true);
        $("#_020_of52d_name_address").attr("disabled", true);
        $("#type_of52").change(function() {
            if ( $("#type_of52").val() == "a"){
                $("#div_of52a_").show();
                $("#_016_of52a_party_identifier").attr("disabled", false);
                $("#_017_of52a_identifier_code").attr("disabled", false);
                $("#div_of52d_").hide();
                $("#_019_of52d_party_identifier").attr("disabled", true);
                $("#_020_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52").val() == "d"){
                $("#div_of52a_").hide();
                $("#_016_of52a_party_identifier").attr("disabled", true);
                $("#_017_of52a_identifier_code").attr("disabled", true);
                $("#div_of52d_").show();
                $("#_019_of52d_party_identifier").attr("disabled", false);
                $("#_020_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#_016_of52a_party_identifier").attr("disabled", true);
                $("#_017_of52a_identifier_code").attr("disabled", true);
                $("#div_of52d_").hide();
                $("#_019_of52d_party_identifier").attr("disabled", true);
                $("#_020_of52d_name_address").attr("disabled", true);
            }
        });
    });
</script>--%>
