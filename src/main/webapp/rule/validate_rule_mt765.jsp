<%-- 
    Document   : validate_rule_mt765
    Created on : Feb 27, 2024, 5:46:10 PM
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
                _011_mf21_related_reference :"required",
                
                //mf52_a_d
                _020_mf52a_party_identifier: "required",
                _021_mf52a_identifier_code: "required",
                _022_mf52d_party_identifier: "required",
                _023_mf52d_name_and_address: "required",
                
                _050_mf22g_demand_type: "required",
                
                _056_mf32b_currency: "required",
                _057_mf32b_amount: "required",
                
                
                
                
                
                

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_transaction_reference_number: {required: "mf20_transaction_reference_number harus diisi..!!"},
                _011_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                
                _020_mf52a_party_identifier: {required: "mf52a_party_identifier harus diisi..!!"},
                _021_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _022_mf52d_party_identifier: {required: "mf52d_party_identifier harus diisi..!!"},
                _023_mf52d_name_and_address: {required: "mf52d_name_and_address harus diisi..!!"},
                
                _050_mf22g_demand_type: {required: "mf22g_demand_type harus diisi..!!"},
                _056_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _057_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},

                
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
        $("#_020_mf52a_party_identifier").attr("disabled", true);
        $("#_021_mf52a_identifier_code").attr("disabled", true);
        $("#_022_mf52d_party_identifier").attr("disabled", true);
        $("#_023_mf52d_name_and_address").attr("disabled", true);
        $("#type_mf52_issuing_bank").change(function() {
            if ( $("#type_mf52_issuing_bank").val() == "a"){
                $("#div_mf52a_").show();
                $("#div_mf52d_").hide();
                $("#_020_mf52a_party_identifier").attr("disabled", false);
                $("#_021_mf52a_identifier_code").attr("disabled", false);
                $("#_022_mf52d_party_identifier").attr("disabled", true);
                $("#_023_mf52d_name_and_address").attr("disabled", true);
            } else if ( $("#type_mf52_issuing_bank").val() == "d"){
                $("#div_mf52a_").hide();
                $("#div_mf52d_").show();
                $("#_020_mf52a_party_identifier").attr("disabled", true);
                $("#_021_mf52a_identifier_code").attr("disabled", true);
                $("#_022_mf52d_party_identifier").attr("disabled", false);
                $("#_023_mf52d_name_and_address").attr("disabled", false);
            } else{
                $("#div_mf52a_").hide();
                $("#div_mf52d_").hide();
                $("#_020_mf52a_party_identifier").attr("disabled", true);
                $("#_021_mf52a_identifier_code").attr("disabled", true);
                $("#_022_mf52d_party_identifier").attr("disabled", true);
                $("#_023_mf52d_name_and_address").attr("disabled", true);
            }
        });
        
        //of59
         //of59/59a sequence b3
        $("#div_of59_seq_b").hide();
        $("#div_of59a_seq_b").hide();
        $("#_025_of59_account").attr("disabled", true);
        $("#_026_of59a_name_and_address").attr("disabled", true);
        $("#_030_of59a_account").attr("disabled", true);
        $("#_031_of59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b").change(function() {
            if ( $("#type_of59_59a_seq_b").val() == "59"){
                $("#div_of59_seq_b").show();
                $("#div_of59a_seq_b").hide();
                $("#_025_of59_account").attr("disabled", false);
                $("#_026_of59a_name_and_address").attr("disabled", false);
                $("#_030_of59a_account").attr("disabled", true);
                $("#_031_of59a_identifier_code").attr("disabled", true);
            } else if ( $("#type_of59_59a_seq_b").val() == "59a"){
                $("#div_of59_seq_b").hide();
                $("#div_of59a_seq_b").show();
                $("#_025_of59_account").attr("disabled", true);
                $("#_026_of59a_name_and_address").attr("disabled", true);
                $("#_030_of59a_account").attr("disabled", false);
                $("#_031_of59a_identifier_code").attr("disabled", false);
            } else{
                $("#div_of59_seq_b").hide();
                $("#div_of59a_seq_b").hide();
                $("#_025_of59_account").attr("disabled", true);
                $("#_026_of59a_name_and_address").attr("disabled", true);
                $("#_030_of59a_account").attr("disabled", true);
                $("#_031_of59a_identifier_code").attr("disabled", true);
            }
        });
        
        //of56_a_b_d
        $("#div_of56a_").hide();
        $("#div_of56b_").hide();
        $("#div_of56d_").hide();
        $("#_086_of56a_party_identifier").attr("disabled", true);
        $("#_087_of56a_identifier_code").attr("disabled", true);
        $("#_090_of56b_party_identifier").attr("disabled", true);
        $("#_091_of56b_location").attr("disabled", true);
        $("#_096_of56d_party_identifier").attr("disabled", true);
        $("#_097_of56d_name_and_address").attr("disabled", true);
        $("#type_of56_").change(function () {
            if ($("#type_of56_").val() == "a") {
                $("#div_of56a_").show();
                $("#div_of56b_").hide();
                $("#div_of56d_").hide();
                $("#_086_of56a_party_identifier").attr("disabled", false);
                $("#_087_of56a_identifier_code").attr("disabled", false);
                $("#_090_of56b_party_identifier").attr("disabled", true);
                $("#_091_of56b_location").attr("disabled", true);
                $("#_096_of56d_party_identifier").attr("disabled", true);
                $("#_097_of56d_name_and_address").attr("disabled", true);
            } else if ($("#type_of56_").val() == "b") {
                $("#div_of56a_").hide();
                $("#div_of56b_").show();
                $("#div_of56d_").hide();
                $("#_086_of56a_party_identifier").attr("disabled", true);
                $("#_087_of56a_identifier_code").attr("disabled", true);
                $("#_090_of56b_party_identifier").attr("disabled", false);
                $("#_091_of56b_location").attr("disabled", false);
                $("#_096_of56d_party_identifier").attr("disabled", true);
                $("#_097_of56d_name_and_address").attr("disabled", true);
            } else if ($("#type_of56_").val() == "d") {
                $("#div_of56a_").hide();
                $("#div_of56b_").hide();
                $("#div_of56d_").show();
                $("#_086_of56a_party_identifier").attr("disabled", true);
                $("#_087_of56a_identifier_code").attr("disabled", true);
                $("#_090_of56b_party_identifier").attr("disabled", true);
                $("#_091_of56b_location").attr("disabled", true);
                $("#_096_of56d_party_identifier").attr("disabled", false);
                $("#_097_of56d_name_and_address").attr("disabled", false);
            } else {
                $("#div_of56a_").hide();
                $("#div_of56b_").hide();
                $("#div_of56d_").hide();
                $("#_086_of56a_party_identifier").attr("disabled", true);
                $("#_087_of56a_identifier_code").attr("disabled", true);
                $("#_090_of56b_party_identifier").attr("disabled", true);
                $("#_091_of56b_location").attr("disabled", true);
                $("#_096_of56d_party_identifier").attr("disabled", true);
                $("#_097_of56d_name_and_address").attr("disabled", true);
            }
        });
        
        //of57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_100_of57a_party_identifier").attr("disabled", true);
        $("#_101_of57a_identifier_code").attr("disabled", true);
        $("#_106_of57b_party_identifier").attr("disabled", true);
        $("#_107_of57b_location").attr("disabled", true);
        $("#_110_of57d_party_identifier").attr("disabled", true);
        $("#_111_of57d_name_and_address").attr("disabled", true);
        $("#type_of57_").change(function() {
            if ( $("#type_of57_").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", false);
                $("#_101_of57a_identifier_code").attr("disabled", false);
                $("#_106_of57b_party_identifier").attr("disabled", true);
                $("#_107_of57b_location").attr("disabled", true);
                $("#_110_of57d_party_identifier").attr("disabled", true);
                $("#_111_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_106_of57b_party_identifier").attr("disabled", false);
                $("#_107_of57b_location").attr("disabled", false);
                $("#_110_of57d_party_identifier").attr("disabled", true);
                $("#_111_of57d_name_and_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_106_of57b_party_identifier").attr("disabled", true);
                $("#_107_of57b_location").attr("disabled", true);
                $("#_110_of57d_party_identifier").attr("disabled", false);
                $("#_111_of57d_name_and_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_100_of57a_party_identifier").attr("disabled", true);
                $("#_101_of57a_identifier_code").attr("disabled", true);
                $("#_106_of57b_party_identifier").attr("disabled", true);
                $("#_107_of57b_location").attr("disabled", true);
                $("#_110_of57d_party_identifier").attr("disabled", true);
                $("#_111_of57d_name_and_address").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF52_a_d
        if ($("#_020_mf52a_party_identifier").val() != "" || $("#_021_mf52a_identifier_code").val() != ""){
            $("#type_mf52_issuing_bank").val("a").attr("selected",true);
            $("#div_mf52a_").show();
            $("#div_mf52d_").hide();
            $("#_020_mf52a_party_identifier").attr("disabled", false);
            $("#_021_mf52a_identifier_code").attr("disabled", false);
            $("#_022_mf52d_party_identifier").attr("disabled", true);
            $("#_023_mf52d_name_and_address").attr("disabled", true);
        } else if ($("#_022_mf52d_party_identifier").val() != "" || $("#_023_mf52d_name_and_address").val() != ""){
            $("#type_mf52_issuing_bank").val("d").attr("selected",true);
            $("#div_mf52a_").hide();
            $("#div_mf52d_").show();
            $("#_020_mf52a_party_identifier").attr("disabled", true);
            $("#_021_mf52a_identifier_code").attr("disabled", true);
            $("#_022_mf52d_party_identifier").attr("disabled", false);
            $("#_023_mf52d_name_and_address").attr("disabled", false);
        } else{
            $("#div_mf52a_").hide();
            $("#div_mf52d_").hide();
            $("#_020_mf52a_party_identifier").attr("disabled", true);
            $("#_021_mf52a_identifier_code").attr("disabled", true);
            $("#_022_mf52d_party_identifier").attr("disabled", true);
            $("#_023_mf52d_name_and_address").attr("disabled", true);
        }
        
        
        //of59/59a sequence b3
        if ($("#_025_of59_account").val() != "" || $("#_026_of59a_name_and_address").val() != ""){
            $("#type_of59_59a_seq_b").val("59").attr("selected",true);
            $("#div_of59_seq_b").show();
            $("#div_of59a_seq_b").hide();
            $("#_025_of59_account").attr("disabled", false);
            $("#_026_of59a_name_and_address").attr("disabled", false);
            $("#_030_of59a_account").attr("disabled", true);
            $("#_031_of59a_identifier_code").attr("disabled", true);
        } else if ($("#_030_of59a_account").val() != "" || $("#_031_of59a_identifier_code").val() != ""){
            $("#type_of59_59a_seq_b").val("59a").attr("selected",true);
            $("#div_of59_seq_b").hide();
            $("#div_of59a_seq_b").show();
            $("#_025_of59_account").attr("disabled", true);
            $("#_026_of59a_name_and_address").attr("disabled", true);
            $("#_030_of59a_account").attr("disabled", false);
            $("#_031_of59a_identifier_code").attr("disabled", false);
        } else{
            $("#div_of59_seq_b").hide();
            $("#div_of59a_seq_b").hide();
            $("#_025_of59_account").attr("disabled", true);
            $("#_026_of59a_name_and_address").attr("disabled", true);
            $("#_030_of59a_account").attr("disabled", true);
            $("#_031_of59a_identifier_code").attr("disabled", true);
        }
        
        if ($("#_086_of56a_party_identifier").val() != "" || $("#_087_of56a_identifier_code").val() != "") {
            $("#type_of56_").val("a").attr("selected", true);
            $("#div_of56a_").show();
            $("#div_of56b_").hide();
            $("#div_of56d_").hide();
            $("#_086_of56a_party_identifier").attr("disabled", false);
            $("#_087_of56a_identifier_code").attr("disabled", false);
            $("#_090_of56b_party_identifier").attr("disabled", true);
            $("#_091_of56b_location").attr("disabled", true);
            $("#_096_of56d_party_identifier").attr("disabled", true);
            $("#_097_of56d_name_and_address").attr("disabled", true);
        } else if ($("#_090_of56b_party_identifier").val() != "" || $("#_091_of56b_location").val() != "") {
            $("#type_of56_").val("b").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56b_").show();
            $("#div_of56d_").hide();
            $("#_086_of56a_party_identifier").attr("disabled", true);
            $("#_087_of56a_identifier_code").attr("disabled", true);
            $("#_090_of56b_party_identifier").attr("disabled", false);
            $("#_091_of56b_location").attr("disabled", false);
            $("#_096_of56d_party_identifier").attr("disabled", true);
            $("#_097_of56d_name_and_address").attr("disabled", true);
        } else if ($("#_096_of56d_party_identifier").val() != "" || $("#_097_of56d_name_and_address").val() != "") {
            $("#type_of56_").val("d").attr("selected", true);
            $("#div_of56a_").hide();
            $("#div_of56b_").hide();
            $("#div_of56d_").show();
            $("#_086_of56a_party_identifier").attr("disabled", true);
            $("#_087_of56a_identifier_code").attr("disabled", true);
            $("#_090_of56b_party_identifier").attr("disabled", true);
            $("#_091_of56b_location").attr("disabled", true);
            $("#_096_of56d_party_identifier").attr("disabled", false);
            $("#_097_of56d_name_and_address").attr("disabled", false);
        } else {
            $("#div_of56a_").hide();
            $("#div_of56b_").hide();
            $("#div_of56d_").hide();
            $("#_086_of56a_party_identifier").attr("disabled", true);
            $("#_087_of56a_identifier_code").attr("disabled", true);
            $("#_090_of56b_party_identifier").attr("disabled", true);
            $("#_091_of56b_location").attr("disabled", true);
            $("#_096_of56d_party_identifier").attr("disabled", true);
            $("#_097_of56d_name_and_address").attr("disabled", true);
        }
        
          //of57_a_b_d
        if ($("#_100_of57a_party_identifier").val() != "" || $("#_101_of57a_identifier_code").val() != ""){
            $("#type_of57_").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", false);
            $("#_101_of57a_identifier_code").attr("disabled", false);
            $("#_106_of57b_party_identifier").attr("disabled", true);
            $("#_107_of57b_location").attr("disabled", true);
            $("#_110_of57d_party_identifier").attr("disabled", true);
            $("#_111_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_106_of57b_party_identifier").val() != "" || $("#_107_of57b_location").val() != ""){
            $("#type_of57_").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_106_of57b_party_identifier").attr("disabled", false);
            $("#_107_of57b_location").attr("disabled", false);
            $("#_110_of57d_party_identifier").attr("disabled", true);
            $("#_111_of57d_name_and_address").attr("disabled", true);
        } else if ($("#_110_of57d_party_identifier").val() != "" || $("#_111_of57d_name_and_address").val() != ""){
            $("#type_of57_").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_106_of57b_party_identifier").attr("disabled", true);
            $("#_107_of57b_location").attr("disabled", true);
            $("#_110_of57d_party_identifier").attr("disabled", false);
            $("#_111_of57d_name_and_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_100_of57a_party_identifier").attr("disabled", true);
            $("#_101_of57a_identifier_code").attr("disabled", true);
            $("#_106_of57b_party_identifier").attr("disabled", true);
            $("#_107_of57b_location").attr("disabled", true);
            $("#_110_of57d_party_identifier").attr("disabled", true);
            $("#_111_of57d_name_and_address").attr("disabled", true);
        }

    });
    
</script>
