<%-- 
    Document   : validate_rule_mtn90
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : M Abdul Hadi
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
                _010_mf20_Transaction_Reference_Number: "required",
                _020_mf21_Related_Reference: "required",
                _030_mf25_Account_Identification: "required",

                //mf32_c_d
                type_mf32_: "required",
                _040_mf32c_Date: "required",
                _041_mf32c_Currency: "required",
                _042_mf32c_Amount: "required",

                _043_mf32d_Date: "required",
                _044_mf32d_Currency: "required",
                _045_mf32d_Amount: "required",

                //of52_a_d
                _051_of52a_Identifier_Code: "required",
                _053_of52d_Name_and_Address: "required",

                //MF71B
                _060_mf71b_Details_Of_Charges: "required"

            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        
        //mf32_c_d
        $("#div_mf32c_").hide();
        $("#div_mf32d_").hide();
        $("#_040_mf32c_Date").attr("disabled", true);
        $("#_041_mf32c_Currency").attr("disabled", true);
        $("#_042_mf32c_Amount").attr("disabled", true);
        $("#_043_mf32d_Date").attr("disabled", true);
        $("#_044_mf32d_Currency").attr("disabled", true);
        $("#_045_mf32d_Amount").attr("disabled", true);
        $("#type_mf32_").change(function() {
            if ( $("#type_mf32_").val() == "c"){
                $("#div_mf32c_").show();
                $("#div_mf32d_").hide();
                $("#_040_mf32c_Date").attr("disabled", false);
                $("#_041_mf32c_Currency").attr("disabled", false);
                $("#_042_mf32c_Amount").attr("disabled", false);
                $("#_043_mf32d_Date").attr("disabled", true);
                $("#_044_mf32d_Currency").attr("disabled", true);
                $("#_045_mf32d_Amount").attr("disabled", true);
            } else if ( $("#type_mf32_").val() == "d"){
                $("#div_mf32c_").hide();
                $("#div_mf32d_").show();
                $("#_040_mf32c_Date").attr("disabled", true);
                $("#_041_mf32c_Currency").attr("disabled", true);
                $("#_042_mf32c_Amount").attr("disabled", true);
                $("#_043_mf32d_Date").attr("disabled", false);
                $("#_044_mf32d_Currency").attr("disabled", false);
                $("#_045_mf32d_Amount").attr("disabled", false);
            } else{
                $("#div_mf32c_").hide();
                $("#div_mf32d_").hide();
                $("#_040_mf32c_Date").attr("disabled", true);
                $("#_041_mf32c_Currency").attr("disabled", true);
                $("#_042_mf32c_Amount").attr("disabled", true);
                $("#_043_mf32d_Date").attr("disabled", true);
                $("#_044_mf32d_Currency").attr("disabled", true);
                $("#_045_mf32d_Amount").attr("disabled", true);
            }
        });

        //of52_a_d
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_050_of52a_Party_Identifier").attr("disabled", true);
        $("#_051_of52a_Identifier_Code").attr("disabled", true);
      //disabled", true);
        $("#_052_of52d_Party_Identifier").attr("disabled", true);
        $("#_053_of52d_Name_and_Address").attr("disabled", true);
        $("#type_of52_").change(function() {
            if ( $("#type_of52_").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_050_of52a_Party_Identifier").attr("disabled", false);
                $("#_051_of52a_Identifier_Code").attr("disabled", false);
              //disabled", false);
                $("#_052_of52d_Party_Identifier").attr("disabled", true);
                $("#_053_of52d_Name_and_Address").attr("disabled", true);
            } else if ( $("#type_of52_").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_050_of52a_Party_Identifier").attr("disabled", true);
                $("#_051_of52a_Identifier_Code").attr("disabled", true);
              //disabled", true);
                $("#_052_of52d_Party_Identifier").attr("disabled", false);
                $("#_053_of52d_Name_and_Address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_050_of52a_Party_Identifier").attr("disabled", true);
                $("#_051_of52a_Identifier_Code").attr("disabled", true);
              //disabled", true);
                $("#_052_of52d_Party_Identifier").attr("disabled", true);
                $("#_053_of52d_Name_and_Address").attr("disabled", true);
            }
        });
    });

</script>

<script type="text/javascript">
    $(document).ready(function(){
        
        //MF32_c_d
        if ($("#_040_mf32c_Date").val() != "" || $("#_041_mf32c_Currency").val() != "" || $("#_042_mf32c_Amount").val() != "" ){
            $("#type_mf32_").val("c").attr("selected",true);
            $("#div_mf32c_").show();
            $("#div_mf32d_").hide();
            $("#_040_mf32c_Date").attr("disabled", false);
            $("#_041_mf32c_Currency").attr("disabled", false);
            $("#_042_mf32c_Amount").attr("disabled", false);
            $("#_043_mf32d_Date").attr("disabled", true);
            $("#_044_mf32d_Currency").attr("disabled", true);
            $("#_045_mf32d_Amount").attr("disabled", true);
        } else if ($("#_043_mf32d_Date").val() != "" || $("#_044_mf32d_Currency").val() != "" || $("#_045_mf32d_Amount").val() != ""){
            $("#type_mf32_").val("d").attr("selected",true);
            $("#div_mf32c_").hide();
            $("#div_mf32d_").show();
            $("#_040_mf32c_Date").attr("disabled", true);
            $("#_041_mf32c_Currency").attr("disabled", true);
            $("#_042_mf32c_Amount").attr("disabled", true);
            $("#_043_mf32d_Date").attr("disabled", false);
            $("#_044_mf32d_Currency").attr("disabled", false);
            $("#_045_mf32d_Amount").attr("disabled", false);
        } else{
            $("#div_mf32c_").hide();
            $("#div_mf32d_").hide();
            $("#_040_mf32c_Date").attr("disabled", true);
            $("#_041_mf32c_Currency").attr("disabled", true);
            $("#_042_mf32c_Amount").attr("disabled", true);
            $("#_043_mf32d_Date").attr("disabled", true);
            $("#_044_mf32d_Currency").attr("disabled", true);
            $("#_045_mf32d_Amount").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_050_of52a_Party_Identifier").val() != "" || $("#_051_of52a_Identifier_Code").val() != ""){
            $("#type_of52_").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_050_of52a_Party_Identifier").attr("disabled", false);
            $("#_051_of52a_Identifier_Code").attr("disabled", false);
            $("#_052_of52d_Party_Identifier").attr("disabled", true);
            $("#_053_of52d_Name_and_Address").attr("disabled", true);
        } else if ($("#_052_of52d_Party_Identifier").val() != "" || $("#_053_of52d_Name_and_Address").val() != ""){
            $("#type_of52_").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_050_of52a_Party_Identifier").attr("disabled", true);
            $("#_051_of52a_Identifier_Code").attr("disabled", true);
            $("#_052_of52d_Party_Identifier").attr("disabled", false);
            $("#_053_of52d_Name_and_Address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_050_of52a_Party_Identifier").attr("disabled", true);
            $("#_051_of52a_Identifier_Code").attr("disabled", true);
            $("#_052_of52d_Party_Identifier").attr("disabled", true);
            $("#_053_of52d_Name_and_Address").attr("disabled", true);
        }
        
    });

</script>
