<%-- 
    Document   : validate_rule_mt705
    update on : Aug 24, 2018, 
    Author     : Sri Puji I
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
                _020_mf20_Documentary_Credit_Number: "required",
            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf27_Number: {required: "mf27 harus diisi..!!"},
                _011_mf27_Total: {required: "mf27 total harus diisi..!!"},
                _020_mf20_Documentary_Credit_Number: {required: "mf20 documentary credit harus diisi..!!"},

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

<!--<script type="text/javascript">
    $(document).ready(function () {

        $("#check_of39a").hide();
        $("#_070_of39a_tolerance1").attr("disabled", true);
        $("#_071_of39a_tolerance2").attr("disabled", true);
        $("#percentage_credit_amount_checkbox").click(function () {
            if ($("#percentage_credit_amount_checkbox").is(":checked")) {
                $("#check_of39a").show();
                $("#_070_of39a_tolerance1").attr("disabled", false);
                $("#_071_of39a_tolerance2").attr("disabled", false);
            } else {
                $("#check_of39a").hide();
                $("#_070_of39a_percentage_credit_amount_tolerance1").attr("disabled", true);
                $("#_071_of39a_tolerance2").attr("disabled", true);
            }
        });



        //of52a//
        $("#div_of41a").hide();
        $("#div_of41d").hide();
        $("#_091_of41a_identifier_code").attr("disabled", true);
        $("#_092_of41a_code").attr("disabled", true);
        $("#_093_of41d_Name_and_address").attr("disabled", true);
        $("#_094_of41d_code").attr("disabled", true);
        $("#type_of41_Available").change(function () {
            if ($("#type_of41_Available").val() == "a") {
                $("#div_of41a").show();
                $("#div_of41d").hide();
                $("#_091_of41a_identifier_code").attr("disabled", false);
                $("#_092_of41a_code").attr("disabled", false);
                $("#_093_of41d_Name_and_address").attr("disabled", true);
                $("#_094_of41d_code").attr("disabled", true);
            } else if ($("#type_of41_Available").val() == "d") {
                $("#div_of41a").hide();
                $("#div_of41d").show();
                $("#_091_of41a_identifier_code").attr("disabled", true);
                $("#_092_of41a_code").attr("disabled", true);
                $("#_093_of41d_Name_and_address").attr("disabled", false);
                $("#_094_of41d_code").attr("disabled", false);
            } else {
                $("#div_of41a").hide();
                $("#div_of41d").hide();
                $("#_091_of41a_identifier_code").attr("disabled", true);
                $("#_092_of41a_code").attr("disabled", true);
                $("#_093_of41d_Name_and_address").attr("disabled", true);
                $("#_094_of41d_code").attr("disabled", true);
            }
        });



        //OF57A//
        $("#div_of57a").hide();
        $("#div_of57b").hide();
        $("#div_of57d").hide();
        $("#_171_of57a_party_identifire").attr("disabled", true);
        $("#_172_of57a_identifier_code").attr("disabled", true);
        $("#_173_of57b_party_identifire").attr("disabled", true);
        $("#_174_of57b_location").attr("disabled", true);
        $("#_175_of57d_party_identifire").attr("disabled", true);
        $("#_176_of57d_name_address").attr("disabled", true);
        $("#type_of57_advise_through_bank").change(function () {
            if ($("#type_of57_advise_through_bank").val() == "A") {
                $("#div_of57a").show();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", false);
                $("#_172_of57a_identifier_code").attr("disabled", false);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_advise_through_bank").val() == "B") {
                $("#div_of57a").hide();
                $("#div_of57b").show();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", false);
                $("#_174_of57b_location").attr("disabled", false);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            } else if ($("#type_of57_advise_through_bank").val() == "D") {
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").show();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", false);
                $("#_176_of57d_name_address").attr("disabled", false);
            } else {
                $("#div_of57a").hide();
                $("#div_of57b").hide();
                $("#div_of57d").hide();
                $("#_171_of57a_party_identifire").attr("disabled", true);
                $("#_172_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifire").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_175_of57d_party_identifire").attr("disabled", true);
                $("#_176_of57d_name_address").attr("disabled", true);
            }
        });


    });
</script>-->


<!-- rule view -->
<!--<script language="javascript">
    $(document).ready(function () {

        //OF39A_check
        if ($("#_070_of39a_tolerance1").val() != "" || $("#_071_of39a_tolerance2").val() != "") {
            $("#percentage_credit_amount_checkbox").attr("checked", true);
            $("#check_of39a").show();
            $("#_070_of39a_tolerance1").attr("disabled", false);
            $("#_071_of39a_tolerance2").attr("disabled", false);
        } else {
            $("#check_of39a").hide();
            $("#_070_of39a_tolerance1").attr("disabled", true);
            $("#_071_of39a_tolerance2").attr("disabled", true);
        }



        //of57 a_b_d
        if ($("#_171_of57a_party_identifire").val() != "" || $("#_172_of57a_identifier_code").val() != "") {
            $("#type_of57_advise_through_bank").val("A").attr("selected", true);
            $("#div_of57a").show();
            $("#div_of57b").hide();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", false);
            $("#_172_of57a_identifier_code").attr("disabled", false);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);

        } else if ($("#_173_of57b_party_identifire").val() != "" || $("#_174_of57b_location").val() != "") {
            $("#type_of57_advise_through_bank").val("B").attr("selected", true);
            $("#div_of57a").hide();
            $("#div_of57b").show();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", false);
            $("#_174_of57b_location").attr("disabled", false);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);
        } else if ($("#_175_of57d_party_identifire").val() != "" || $("#_176_of57d_name_address").val() != "") {
            $("#type_of57_advise_through_bank").val("D").attr("selected", true);
            $("#div_of57a").hide();
            $("#div_of57b").hide();
            $("#div_of57d").show();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", false);
            $("#_176_of57d_name_address").attr("disabled", false);
        } else {
            $("#div_of57a").hide();
            $("#div_of57b").hide();
            $("#div_of57d").hide();
            $("#_171_of57a_party_identifire").attr("disabled", true);
            $("#_172_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifire").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_175_of57d_party_identifire").attr("disabled", true);
            $("#_176_of57d_name_address").attr("disabled", true);
        }



        if ($("#_091_of41a_identifier_code").val() != "" || $("#_092_of41a_code").val() != "") {
            $("#type_of41_Available").val("a").attr("selected", true);
            $("#div_of41a").show();
            $("#div_of41d").hide();
            $("#_091_of41a_identifier_code").attr("disabled", false);
            $("#_092_of41a_code").attr("disabled", false);
            $("#_093_of41d_Name_and_address").attr("disabled", true);
            $("#_094_of41d_code").attr("disabled", true);
        } else if ($("#_093_of41d_Name_and_address").val() != "" || $("#_094_of41d_code").val() != "") {
            $("#type_of41_Available").val("d").attr("selected", true);
            $("#div_of41a").hide();
            $("#div_of41d").show();
            $("#_091_of41a_identifier_code").attr("disabled", true);
            $("#_092_of41a_code").attr("disabled", true);
            $("#_093_of41d_Name_and_address").attr("disabled", false);
            $("#_094_of41d_code").attr("disabled", false);
        } else {
            $("#div_of41a").hide();
            $("#div_of41d").hide();
            $("#_091_of41a_identifier_code").attr("disabled", true);
            $("#_092_of41a_code").attr("disabled", true);
            $("#_093_of41d_Name_and_address").attr("disabled", true);
            $("#_094_of41d_code").attr("disabled", true);
        }





    });
</script>-->