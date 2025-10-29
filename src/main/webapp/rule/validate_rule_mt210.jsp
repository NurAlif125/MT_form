<%-- 
    Document   : validate_rule_mt210
    Created on : Aug 12, 2012, 2:16:33 PM
    Author     : Sri Puji 
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
                _010_mf20_transactions_reference_number: "required",
                _020_mf25_accout_identification: "required",
                _040_mf30_value_date:"required",
                _050_mf21_related_references:"required",
                

                //mf32a
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",
                
               //of50
               _080_of50_name_address:"required",
               _081_of50c_party_identifier:"required",
               _082_of50f_party_identifier:"required",
               _083_of50f_name_address:"required",
               

//                //of52
//                _111_of52a_identifier_code: "required",
//                _114_of52d_name_address: "required",
//
//                //of53
//                _121_of53a_identifier_code: "required",
//                _126_of53d_name_address: "required",

                //of54
//                _131_of54a_identifier_code: "required",
//                _136_of54d_name_address: "required",

                //of56
//                _161_of56a_identifier_code: "required",
//                _165_of56d_name_address: "required",

                //of57
//                _171_of57a_identifier_code: "required",
//                _177_of57d_name_address: "required",
//
//                //of58
//                type_of58_: "required",
//                _181_of58a_identifier_code: "required",
//                _184_of58d_name_address: "required"
            }
        });
    });
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />

<script type="text/javascript">
    $(document).ready(function(){
        //of13c
        $("#div_of13c_").hide();
        $("#_022_of13c_code").attr("disabled", true);
        $("#_020_of13c_add").click(function() {
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        });
        $("#_021_of13c_remove").click(function() {
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        });

        //of52_a_d
        $("#div_of52a").hide();
        $("#div_of52d").hide();
        $("#_100_of52a_party_identifier").attr("disabled", true);
        $("#_101_of52a_identifier_code").attr("disabled", true);
        $("#_102_of52d_party_identifier").attr("disabled", true);
        $("#_103_of52d_name_address").attr("disabled", true);
        $("#type_of52").change(function() {
            if ( $("#type_of52").val() == "a"){
                $("#div_of52a").show();
                $("#div_of52d").hide();
                $("#_100_of52a_party_identifier").attr("disabled", false);
                $("#_101_of52a_identifier_code").attr("disabled", false);
                $("#_102_of52d_party_identifier").attr("disabled", true);
                $("#_103_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52").val() == "d"){
                $("#div_of52a").hide();
                $("#div_of52d").show();
                $("#_100_of52a_party_identifier").attr("disabled", true);
                $("#_101_of52a_identifier_code").attr("disabled", true);
                $("#_102_of52d_party_identifier").attr("disabled", false);
                $("#_103_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a").hide();
                $("#div_of52d").hide();
                $("#_100_of52a_party_identifier").attr("disabled", true);
                $("#_101_of52a_identifier_code").attr("disabled", true);
                $("#_102_of52d_party_identifier").attr("disabled", true);
                $("#_103_of52d_name_address").attr("disabled", true);
            }
        });

        //of50_a_c_f
        $("#div_of50").hide();
        $("#div_of50c").hide();
        $("#div_of50f").hide();
        $("#_080_of50_name_address").attr("disabled", true);
        $("#_081_of50c_identifier_code").attr("disabled", true);
        $("#_082_of50f_party_identifier").attr("disabled", true);
        $("#_083_of50f_number").attr("disabled", true);
        $("#_084_of50f_details").attr("disabled", true);
        $("#type_of50_ordering_customer").change(function() {
            if ( $("#type_of50_ordering_customer").val() == "a"){
                $("#div_of50").show();
                $("#div_of50c").hide();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", false);
                $("#_081_of50c_identifier_code").attr("disabled", true);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
            } else if( $("#type_of50_ordering_customer").val() == "c"){
                $("#div_of50").hide();
                $("#div_of50c").show();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", false);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
            } else if ( $("#type_of50_ordering_customer").val() == "f"){
                $("#div_of50").hide();
                $("#div_of50c").hide();
                $("#div_of50f").show();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", true);
                $("#_082_of50f_party_identifier").attr("disabled", false);
                $("#_083_of50f_number").attr("disabled", false);
                $("#_084_of50f_details").attr("disabled", false);
            } else{
                $("#div_of50").hide();
                $("#div_of50c").hide();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", true);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
               
            }
        });

      

       // of56_a_d
      
        $("#div_of56a").hide();
        $("#div_of56d").hide();
        $("#_110_of56a_party_identifier").attr("disabled", true);
        $("#_111_of56a_identifier_code").attr("disabled", true);
        $("#_112_of56d_party_identifier").attr("disabled", true);
        $("#_113_of56d_name_address").attr("disabled", true);
        $("#type_of56").change(function() {
            if ( $("#type_of56").val() == "a"){
                $("#div_of56a").show();
                $("#div_of56d").hide();
                $("#_110_of56a_party_identifier").attr("disabled", false);
                $("#_111_of56a_identifier_code").attr("disabled", false);
                $("#_112_of56d_party_identifier").attr("disabled", true);
                $("#_113_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56").val() == "d"){
                $("#div_of56a").hide();
                $("#div_of56d").show();
                $("#_110_of56a_party_identifier").attr("disabled", true);
                $("#_111_of56a_identifier_code").attr("disabled", true);
                $("#_112_of56d_party_identifier").attr("disabled", false);
                $("#_113_of56d_name_address").attr("disabled", false);
            } else{
                $("#div_of56a").hide();
                $("#div_of56d").hide();
                $("#_110_of56a_party_identifier").attr("disabled", true);
                $("#_111_of56a_identifier_code").attr("disabled", true);
                $("#_112_of56d_party_identifier").attr("disabled", true);
                $("#_113_of56d_name_address").attr("disabled", true);
            }
        });

       
    });
</script>

<!-- rule view -->
<script type="text/javascript">
    $(document).ready(function(){
        //of13c
        if ($("#_022_of13c_code").val() != ""){
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        }else{
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        }

        //of50_a_c_f
         if ($("#_080_of50_name_address").val() != ""){
                $("#type_of50_ordering_customer").val("a").attr("selected",true);
                $("#div_of50").show();
                $("#div_of50c").hide();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", false);
                $("#_081_of50c_identifier_code").attr("disabled", false);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
           } else if ($("#_081_of50c_identifier_code").val() != ""){
                $("#type_of50_ordering_customer").val("c").attr("selected",true);
                $("#div_of50").hide();
                $("#div_of50c").show();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", false);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
               
           } else if ($("#_082_of50f_party_identifier").val() != "" || $("#_083_of50f_number").val() != "" || $("#_084_of50f_details").val() != ""){
                $("#type_of50_ordering_customer").val("f").attr("selected",true);
                $("#div_of50").hide();
                $("#div_of50c").hide();
                $("#div_of50f").show();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", true);
                $("#_082_of50f_party_identifier").attr("disabled", false);
                $("#_083_of50f_number").attr("disabled", false);
                $("#_084_of50f_details").attr("disabled", false);
                
            } else{
                $("#div_of50").hide();
                $("#div_of50c").hide();
                $("#div_of50f").hide();
                $("#_080_of50_name_address").attr("disabled", true);
                $("#_081_of50c_identifier_code").attr("disabled", true);
                $("#_082_of50f_party_identifier").attr("disabled", true);
                $("#_083_of50f_number").attr("disabled", true);
                $("#_084_of50f_details").attr("disabled", true);
                
            }
        
        
        if ($("#_100_of52a_party_identifier").val() != "" || $("#_101_of52a_identifier_code").val() != ""){
            $("#type_of52").val("a").attr("selected",true);
            $("#div_of52a").show();
            $("#div_of52d").hide();
            $("#_100_of52a_party_identifier").attr("disabled", false);
            $("#_101_of52a_identifier_code").attr("disabled", false);
            $("#_102_of52d_party_identifier").attr("disabled", true);
            $("#_103_of52d_name_address").attr("disabled", true);
        } else if ($("#_102_of52d_party_identifier").val() != "" || $("#_103_of52d_name_address").val() != ""){
            $("#type_of56").val("d").attr("selected",true);
            $("#div_of52a").hide();
            $("#div_of52d").show();
            $("#_100_of52a_party_identifier").attr("disabled", true);
            $("#_101_of52a_identifier_code").attr("disabled", true);
            $("#_102_of52d_party_identifier").attr("disabled", false);
            $("#_103_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a").hide();
            $("#div_of52d").hide();
            $("#_100_of52a_party_identifier").attr("disabled", true);
            $("#_101_of52a_identifier_code").attr("disabled", true);
            $("#_102_of52d_party_identifier").attr("disabled", true);
            $("#_103_of52d_name_address").attr("disabled", true);
        }

       

       

        //of56_a_d
        if ($("#_110_of56a_party_identifier").val() != "" || $("#_111_of56a_identifier_code").val() != ""){
            $("#type_of56").val("a").attr("selected",true);
            $("#div_of56a").show();
            $("#div_of56d").hide();
            $("#_110_of56a_party_identifier").attr("disabled", false);
            $("#_111_of56a_identifier_code").attr("disabled", false);
            $("#_112_of56d_party_identifier").attr("disabled", true);
            $("#_113_of56d_name_address").attr("disabled", true);
        } else if ($("#_112_of56d_party_identifier").val() != "" || $("#_113_of56d_name_address").val() != ""){
            $("#type_of56").val("d").attr("selected",true);
            $("#div_of56a").hide();
            $("#div_of56d").show();
            $("#_110_of56a_party_identifier").attr("disabled", true);
            $("#_111_of56a_identifier_code").attr("disabled", true);
            $("#_112_of56d_party_identifier").attr("disabled", false);
            $("#_113_of56d_name_address").attr("disabled", false);
        } else{
            $("#div_of56a").hide();
            $("#div_of56d").hide();
            $("#_110_of56a_party_identifier").attr("disabled", true);
            $("#_111_of56a_identifier_code").attr("disabled", true);
            $("#_112_of56d_party_identifier").attr("disabled", true);
            $("#_113_of56d_name_address").attr("disabled", true);
        }

        
    });
</script>
