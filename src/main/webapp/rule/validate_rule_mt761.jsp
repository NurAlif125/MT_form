<%-- 
    Document   : mt761
    Created on : Jun 14, 2021, 2:02:58 PM
    Author     : Ovasae
--%>

<script type="text/javascript">
    $(document).ready(function () {
        $("#form1").validate({
            rules: {
//              header
//              unit: "required",
                sender_logical_terminal: "required",
                //sender_type: "required",
                //sender_type_institution: "required",

                //receiver_type: "required",
                receiver_institution: "required",

                priority: "required",
                //monitoring: "required",

                //Mandatory Sequence A General Information
                //15A New Sequence
                //body
                _010_mf27_number: "required",
                _011_mf27_total: "required",
                
//                15B New Sequence
                //MF20
                _020_mf20_undertaking_number: "required",
                
//                MF52a Issuer
                type_mf52a_issuer: "required",
                _031_mf52a_identifier_code: "required",
                _034_mf52d_name_address: "required",
                
                
                
                //template
                template_name: "required"
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_number: {required: "mf27_number harus diisi..!!"},
                _011_mf27_total: {required: "mf27_total harus diisi..!!"},
                _020_mf20_undertaking_number: {required: "mf20_undertaking_number harus diisi..!!"},
                _031_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _034_mf52d_name_address: {required: "mf52d_name_address harus diisi..!!"},
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

<!--Script untuk menampilkan-->
<script type="text/javascript">
    $(document).ready(function () {
      //MF52a Issuer
        $("#div_mf52a_issuer").hide();
        $("#div_mf52d_issuer").hide();
        $("#_030_mf52a_party_identifier").attr("disabled", true);
        $("#_031_mf52a_identifier_code").attr("disabled", true);
        $("#_033_mf52d_party_identifier").attr("disabled", true);
        $("#_034_mf52d_name_address").attr("disabled", true);
        $("#type_mf52a_issuer").change(function () {
            if ($("#type_mf52a_issuer").val() == "a") {
                $("#div_mf52a_issuer").show();
                $("#div_mf52d_issuer").hide();
                $("#_030_mf52a_party_identifier").attr("disabled", false);
                $("#_031_mf52a_identifier_code").attr("disabled", false);
                $("#_033_mf52d_party_identifier").attr("disabled", true);
                $("#_034_mf52d_name_address").attr("disabled", true);
            } else if ($("#type_mf52a_issuer").val() == "d") {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").show();
                $("#_030_mf52a_party_identifier").attr("disabled", true);
                $("#_031_mf52a_identifier_code").attr("disabled", true);
                $("#_033_mf52d_party_identifier").attr("disabled", false);
                $("#_034_mf52d_name_address").attr("disabled", false);
            } else {
                $("#div_mf52a_issuer").hide();
                $("#div_mf52d_issuer").hide();
                $("#_030_mf52a_party_identifier").attr("disabled", true);
                $("#_031_mf52a_identifier_code").attr("disabled", true);
                $("#_033_mf52d_party_identifier").attr("disabled", true);
                $("#_034_mf52d_name_address").attr("disabled", true);
            }
        });
        //end of the line
        
        
    });
</script>



<!--Script untuk mengedit-->
<!--rule view-->
<script language="javascript">
    $(document).ready(function () {
        //MF52a Issuer
        if ($("#_030_mf52a_party_identifier").val() != "" || $("#_031_mf52a_identifier_code").val() != "") {
            $("#type_mf52a_issuer").val("a").attr("selected", true);
            $("#div_mf52a_issuer").show();
            $("#div_mf52d_issuer").hide();
            $("#_030_mf52a_party_identifier").attr("disabled", false);
            $("#_031_mf52a_identifier_code").attr("disabled", false);
            $("#_033_mf52d_party_identifier").attr("disabled", true);
            $("#_144_mf52d_name_address").attr("disabled", true);
        } else if ($("#_033_mf52d_party_identifier").val() != "" || $("#_034_mf52d_name_address").val() != "") {
            $("#type_mf52a_issuer").val("d").attr("selected", true);
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").show();
            $("#_030_mf52a_party_identifier").attr("disabled", true);
            $("#_031_mf52a_identifier_code").attr("disabled", true);
            $("#_033_mf52d_party_identifier").attr("disabled", false);
            $("#_034_mf52d_name_address").attr("disabled", false);
        } else {
            $("#div_mf52a_issuer").hide();
            $("#div_mf52d_issuer").hide();
            $("#_030_mf52a_party_identifier").attr("disabled", true);
            $("#_031_mf52a_identifier_code").attr("disabled", true);
            $("#_033_mf52d_party_identifier").attr("disabled", true);
            $("#_034_mf52d_name_address").attr("disabled", true);
        }
        //end of the line
        
        
        
    });
</script>