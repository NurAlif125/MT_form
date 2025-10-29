<%-- 
    Document   : mt491
    Created on : Aug 20, 2018
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
                //mf20
                _010_mf20_sender_reference: "required",
                
                //mf21
                _020_mf21_related_reference: "required",

                //of23e
                _030_of23e_type: "required",
                
                //of51a
                _041_of51a_identifier_code: "required",
                
                //of53
                _051_of53a_identifier_code: "required",
                
                //of71f
                _060_of71f_currency: "required",
                _061_of71f_amount: "required",
                
                //mf21a
                _080_mf21a_related_sequence_reference: "required",
                
                //of23e
                _090_of23e_type: "required",
                
                //mf32
                type_mf32_face_amount_of_document: "required",
                _110_mf32a_date: "required",
                _111_mf32a_currency: "required",
                _112_mf32a_amount: "required",
                _113_mf32b_currency: "required",
                _114_mf32b_amount: "required",
                _115_mf32k_day_month: "required",
                _116_mf32k_number_of_days_months: "required",
                _117_mf32k_code: "required",
                _118_mf32k_currency: "required",
                _119_mf32k_amount: "required",
                
                //of50d
                _121_of50d_name_address: "required",
                
                //of59
                _131_of59_name_address: "required",
                
                //of71f
                _140_of71f_currency: "required",
                _141_of71f_amount: "required"

            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_sender_reference: {required: "mf20_sender_reference harus diisi..!!"},
                _020_mf21_related_reference: {required: "mf21_related_reference harus diisi..!!"},
                _030_of23e_type: {required: "of23e_type harus diisi..!!"},
                _041_of51a_identifier_code: {required: "of51a_identifier_code harus diisi..!!"},
                _051_of53a_identifier_code: {required: "of53a_identifier_code harus diisi..!!"},
                _060_of71f_currency: {required: "of71f_currency harus diisi..!!"},
                _061_of71f_amount: {required: "of71f_amount harus diisi..!!"},
                _080_mf21a_related_sequence_reference: {required: "mf21a_related_sequence_reference harus diisi..!!"},
                _090_of23e_type: {required: "of23e_type harus diisi..!!"},
                type_mf32_face_amount_of_document: {required: "mf32_face_amount_of_document harus diisi..!!"},
                _110_mf32a_date: {required: "mf32a_date harus diisi..!!"},
                _111_mf32a_currency: {required: "mf32a_currency harus diisi..!!"},
                _112_mf32a_amount: {required: "mf32a_amount harus diisi..!!"},
                _113_mf32b_currency: {required: "mf32b_currency harus diisi..!!"},
                _114_mf32b_amount: {required: "mf32b_amount harus diisi..!!"},
                _115_mf32k_day_month: {required: "mf32k_day_month harus diisi..!!"},
                _116_mf32k_number_of_days_months: {required: "mf32k_number_of_days_months harus diisi..!!"},
                _117_mf32k_code: {required: "mf32k_code harus diisi..!!"},
                _118_mf32k_currency: {required: "mf32k_currency harus diisi..!!"},
                _119_mf32k_amount: {required: "mf32k_amount harus diisi..!!"},
                _121_of50d_name_address: {required: "of50d_name_address harus diisi..!!"},
                _131_of59_name_address: {required: "of59_name_address harus diisi..!!"},
                _140_of71f_currency: {required: "of71f_currency harus diisi..!!"},
                _141_of71f_amount: {required: "of71f_amount harus diisi..!!"}
                
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
        
        //OF23E_check
        $("#check_of23e").hide();
        $("#_030_of23e_type").attr("disabled", true);
        $("#_031_of23e_narrative").attr("disabled", true);
        $("#advice_type_checkbox").click(function(){
            if ($("#advice_type_checkbox").is(":checked")){
                $("#check_of23e").show();
                $("#_030_of23e_type").attr("disabled", false);
                $("#_031_of23e_narrative").attr("disabled", false);
            } else {
                $("#check_of23e").hide();
                $("#_030_of23e_type").attr("disabled", true);
                $("#_031_of23e_narrative").attr("disabled", true);
            }
        });
        
        //OF51A_check
        $("#check_of51a").hide();
        $("#_040_of51a_party_identifier").attr("disabled", true);
        $("#_041_of51a_identifier_code").attr("disabled", true);
        $("#sending_institution_checkbox").click(function(){
            if ($("#sending_institution_checkbox").is(":checked")){
                $("#check_of51a").show();
                $("#_040_of51a_party_identifier").attr("disabled", false);
                $("#_041_of51a_identifier_code").attr("disabled", false);
            } else {
                $("#check_of51a").hide();
                $("#_040_of51a_party_identifier").attr("disabled", true);
                $("#_041_of51a_identifier_code").attr("disabled", true);
            }
        });
        
        //OF71F_check
        $("#check_of71f").hide();
        $("#_060_of71f_currency").attr("disabled", true);
        $("#_061_of71f_amount").attr("disabled", true);
        $("#sender_charges_checkbox").click(function(){
            if ($("#sender_charges_checkbox").is(":checked")){
                $("#check_of71f").show();
                $("#_060_of71f_currency").attr("disabled", false);
                $("#_061_of71f_amount").attr("disabled", false);
            } else {
                $("#check_of71f").hide();
                $("#_060_of71f_currency").attr("disabled", true);
                $("#_061_of71f_amount").attr("disabled", true);
            }
        });
        
        //OF23E_check2
        $("#check2_of23e").hide();
        $("#_090_of23e_type").attr("disabled", true);
        $("#_091_of23e_narrative").attr("disabled", true);
        $("#advice_type_checkbox2").click(function(){
            if ($("#advice_type_checkbox2").is(":checked")){
                $("#check2_of23e").show();
                $("#_090_of23e_type").attr("disabled", false);
                $("#_091_of23e_narrative").attr("disabled", false);
            } else {
                $("#check2_of23e").hide();
                $("#_090_of23e_type").attr("disabled", true);
                $("#_091_of23e_narrative").attr("disabled", true);
            }
        });
        
        //OF50D_check
        $("#check_of50d").hide();
        $("#_120_of50d_party_identifier").attr("disabled", true);
        $("#_121_of50d_name_address").attr("disabled", true);
        $("#principal_checkbox").click(function(){
            if ($("#principal_checkbox").is(":checked")){
                $("#check_of50d").show();
                $("#_120_of50d_party_identifier").attr("disabled", false);
                $("#_121_of50d_name_address").attr("disabled", false);
            } else {
                $("#check_of50d").hide();
                $("#_120_of50d_party_identifier").attr("disabled", true);
                $("#_121_of50d_name_address").attr("disabled", true);
            }
        });
        
        //OF59_check
        $("#check_of59").hide();
        $("#_130_of59_account").attr("disabled", true);
        $("#_131_of59_name_address").attr("disabled", true);
        $("#drawee_checkbox").click(function(){
            if ($("#drawee_checkbox").is(":checked")){
                $("#check_of59").show();
                $("#_130_of59_account").attr("disabled", false);
                $("#_131_of59_name_address").attr("disabled", false);
            } else {
                $("#check_of59").hide();
                $("#_130_of59_account").attr("disabled", true);
                $("#_131_of59_name_address").attr("disabled", true);
            }
        });
        
        //OF71F_check2
        $("#check2_of71f").hide();
        $("#_140_of71f_currency").attr("disabled", true);
        $("#_141_of71f_amount").attr("disabled", true);
        $("#sender_charges_checkbox2").click(function(){
            if ($("#sender_charges_checkbox2").is(":checked")){
                $("#check2_of71f").show();
                $("#_140_of71f_currency").attr("disabled", false);
                $("#_141_of71f_amount").attr("disabled", false);
            } else {
                $("#check2_of71f").hide();
                $("#_140_of71f_currency").attr("disabled", true);
                $("#_141_of71f_amount").attr("disabled", true);
            }
        });
        
        //OF53_a_b
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#_050_of53a_party_identifier").attr("disabled", true);
        $("#_051_of53a_identifier_code").attr("disabled", true);
        $("#_052_of53b_party_identifier").attr("disabled", true);
        $("#_053_of53b_location").attr("disabled", true);
        $("#type_of53_sender_correspondent").change(function() {
            if ( $("#type_of53_sender_correspondent").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", false);
                $("#_051_of53a_identifier_code").attr("disabled", false);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
            } else if ( $("#type_of53_sender_correspondent").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", false);
                $("#_053_of53b_location").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#_050_of53a_party_identifier").attr("disabled", true);
                $("#_051_of53a_identifier_code").attr("disabled", true);
                $("#_052_of53b_party_identifier").attr("disabled", true);
                $("#_053_of53b_location").attr("disabled", true);
            }
        });

        //MF32_a_b_k
        $("#div_mf32a_").hide();
        $("#div_mf32b_").hide();
        $("#div_mf32k_").hide();
        $("#_110_mf32a_date").attr("disabled", true);
        $("#_111_mf32a_currency").attr("disabled", true);
        $("#_112_mf32a_amount").attr("disabled", true);
        $("#_113_mf32b_currency").attr("disabled", true);
        $("#_114_mf32b_amount").attr("disabled", true);
        $("#_115_mf32k_day_month").attr("disabled", true);
        $("#_116_mf32k_number_of_days_months").attr("disabled", true);
        $("#_117_mf32k_code").attr("disabled", true);
        $("#_118_mf32k_currency").attr("disabled", true);
        $("#_119_mf32k_amount").attr("disabled", true);
        $("#type_mf32_face_amount_of_document").change(function() {
            if ( $("#type_mf32_face_amount_of_document").val() == "a"){
                $("#div_mf32a_").show();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_110_mf32a_date").attr("disabled", false);
                $("#_111_mf32a_currency").attr("disabled", false);
                $("#_112_mf32a_amount").attr("disabled", false);
                $("#_113_mf32b_currency").attr("disabled", true);
                $("#_114_mf32b_amount").attr("disabled", true);
                $("#_115_mf32k_day_month").attr("disabled", true);
                $("#_116_mf32k_number_of_days_months").attr("disabled", true);
                $("#_117_mf32k_code").attr("disabled", true);
                $("#_118_mf32k_currency").attr("disabled", true);
                $("#_119_mf32k_amount").attr("disabled", true);
            } else if ( $("#type_mf32_face_amount_of_document").val() == "b"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").show();
                $("#div_mf32k_").hide();
                $("#_110_mf32a_date").attr("disabled", true);
                $("#_111_mf32a_currency").attr("disabled", true);
                $("#_112_mf32a_amount").attr("disabled", true);
                $("#_113_mf32b_currency").attr("disabled", false);
                $("#_114_mf32b_amount").attr("disabled", false);
                $("#_115_mf32k_day_month").attr("disabled", true);
                $("#_116_mf32k_number_of_days_months").attr("disabled", true);
                $("#_117_mf32k_code").attr("disabled", true);
                $("#_118_mf32k_currency").attr("disabled", true);
                $("#_119_mf32k_amount").attr("disabled", true);
            } else if ( $("#type_mf32_face_amount_of_document").val() == "k"){
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").show();
                $("#_110_mf32a_date").attr("disabled", true);
                $("#_111_mf32a_currency").attr("disabled", true);
                $("#_112_mf32a_amount").attr("disabled", true);
                $("#_113_mf32b_currency").attr("disabled", true);
                $("#_114_mf32b_amount").attr("disabled", true);
                $("#_115_mf32k_day_month").attr("disabled", false);
                $("#_116_mf32k_number_of_days_months").attr("disabled", false);
                $("#_117_mf32k_code").attr("disabled", false);
                $("#_118_mf32k_currency").attr("disabled", false);
                $("#_119_mf32k_amount").attr("disabled", false);
            } else{
                $("#div_mf32a_").hide();
                $("#div_mf32b_").hide();
                $("#div_mf32k_").hide();
                $("#_110_mf32a_date").attr("disabled", true);
                $("#_111_mf32a_currency").attr("disabled", true);
                $("#_112_mf32a_amount").attr("disabled", true);
                $("#_113_mf32b_currency").attr("disabled", true);
                $("#_114_mf32b_amount").attr("disabled", true);
                $("#_115_mf32k_day_month").attr("disabled", true);
                $("#_116_mf32k_number_of_days_months").attr("disabled", true);
                $("#_117_mf32k_code").attr("disabled", true);
                $("#_118_mf32k_currency").attr("disabled", true);
                $("#_119_mf32k_amount").attr("disabled", true);
            }
        });
        
    });
</script>


<!-- rule view -->
<script language="javascript">
    $(document).ready(function() {
        
        //OF23E_check
        if ($("#_030_of23e_type").val() != "" || $("#_031_of23e_narrative").val() != ""){
            $("#advice_type_checkbox").attr("checked", true);
            $("#check_of23e").show();
            $("#_030_of23e_type").attr("disabled", false);
            $("#_031_of23e_narrative").attr("disabled", false);
        } else {
            $("#check_of23e").hide();
            $("#_030_of23e_type").attr("disabled", true);
            $("#_031_of23e_narrative").attr("disabled", true);
        }
        
        //OF51A_check
        if ($("#_040_of51a_party_identifier").val() != "" || $("#_041_of51a_identifier_code").val() != ""){
            $("#sending_institution_checkbox").attr("checked", true);
            $("#check_of51a").show();
            $("#_040_of51a_party_identifier").attr("disabled", false);
            $("#_041_of51a_identifier_code").attr("disabled", false);
        } else {
            $("#check_of51a").hide();
            $("#_040_of51a_party_identifier").attr("disabled", true);
            $("#_041_of51a_identifier_code").attr("disabled", true);
        }
        
        //OF71F_check
        if ($("#_060_of71f_currency").val() != "" || $("#_061_of71f_amount").val() != ""){
            $("#sender_charges_checkbox").attr("checked", true);
            $("#check_of71f").show();
            $("#_060_of71f_currency").attr("disabled", false);
            $("#_061_of71f_amount").attr("disabled", false);
        } else {
            $("#check_of71f").hide();
            $("#_060_of71f_currency").attr("disabled", true);
            $("#_061_of71f_amount").attr("disabled", true);
        }
        
        //OF23E_check2
        if ($("#_090_of23e_type").val() != "" || $("#_091_of23e_narrative").val() != ""){
            $("#advice_type_checkbox2").attr("checked", true);
            $("#check2_of23e").show();
            $("#_090_of23e_type").attr("disabled", false);
            $("#_091_of23e_narrative").attr("disabled", false);
        } else {
            $("#check2_of23e").hide();
            $("#_090_of23e_type").attr("disabled", true);
            $("#_091_of23e_narrative").attr("disabled", true);
        }
        
        //OF50D_check
        if ($("#_120_of50d_party_identifier").val() != "" || $("#_121_of50d_name_address").val() != ""){
            $("#principal_checkbox").attr("checked", true);
            $("#check_of50d").show();
            $("#_120_of50d_party_identifier").attr("disabled", false);
            $("#_121_of50d_name_address").attr("disabled", false);
        } else {
            $("#check_of50d").hide();
            $("#_120_of50d_party_identifier").attr("disabled", true);
            $("#_121_of50d_name_address").attr("disabled", true);
        }
        
        //OF59_check
        if ($("#_130_of59_account").val() != "" || $("#_131_of59_name_address").val() != ""){
            $("#drawee_checkbox").attr("checked", true);
            $("#check_of59").show();
            $("#_130_of59_account").attr("disabled", false);
            $("#_131_of59_name_address").attr("disabled", false);
        } else {
            $("#check_of59").hide();
            $("#_130_of59_account").attr("disabled", true);
            $("#_131_of59_name_address").attr("disabled", true);
        }
        
        //OF71F_check2
        if ($("#_140_of71f_currency").val() != "" || $("#_141_of71f_amount").val() != ""){
            $("#sender_charges_checkbox2").attr("checked", true);
            $("#check2_of71f").show();
            $("#_140_of71f_currency").attr("disabled", false);
            $("#_141_of71f_amount").attr("disabled", false);
        } else {
            $("#check2_of71f").hide();
            $("#_140_of71f_currency").attr("disabled", true);
            $("#_141_of71f_amount").attr("disabled", true);
        }
        
        //OF53_a_b
        if ($("#_050_of53a_party_identifier").val() != "" || $("#_051_of53a_identifier_code").val() != ""){
            $("#type_of53_sender_correspondent").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", false);
            $("#_051_of53a_identifier_code").attr("disabled", false);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
        } else if ($("#_052_of53b_party_identifier").val() != "" || $("#_053_of53b_location").val() != ""){
            $("#type_of53_sender_correspondent").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", false);
            $("#_053_of53b_location").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#_050_of53a_party_identifier").attr("disabled", true);
            $("#_051_of53a_identifier_code").attr("disabled", true);
            $("#_052_of53b_party_identifier").attr("disabled", true);
            $("#_053_of53b_location").attr("disabled", true);
        }
        
        //MF32_a_b_k
        if ($("#_110_mf32a_date").val() != "" || $("#_111_mf32a_currency").val() != "" || $("#_112_mf32a_amount").val() != ""){
            $("#type_mf32_face_amount_of_document").val("a").attr("selected",true);
            $("#div_mf32a_").show();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_110_mf32a_date").attr("disabled", false);
            $("#_111_mf32a_currency").attr("disabled", false);
            $("#_112_mf32a_amount").attr("disabled", false);
            $("#_113_mf32b_currency").attr("disabled", true);
            $("#_114_mf32b_amount").attr("disabled", true);
            $("#_115_mf32k_day_month").attr("disabled", true);
            $("#_116_mf32k_number_of_days_months").attr("disabled", true);
            $("#_117_mf32k_code").attr("disabled", true);
            $("#_118_mf32k_currency").attr("disabled", true);
            $("#_119_mf32k_amount").attr("disabled", true);
        } else if ($("#_113_mf32b_currency").val() != "" || $("#_114_mf32b_amount").val() != ""){
            $("#type_mf32_face_amount_of_document").val("b").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").show();
            $("#div_mf32k_").hide();
            $("#_110_mf32a_date").attr("disabled", true);
            $("#_111_mf32a_currency").attr("disabled", true);
            $("#_112_mf32a_amount").attr("disabled", true);
            $("#_113_mf32b_currency").attr("disabled", false);
            $("#_114_mf32b_amount").attr("disabled", false);
            $("#_115_mf32k_day_month").attr("disabled", true);
            $("#_116_mf32k_number_of_days_months").attr("disabled", true);
            $("#_117_mf32k_code").attr("disabled", true);
            $("#_118_mf32k_currency").attr("disabled", true);
            $("#_119_mf32k_amount").attr("disabled", true);
        } else if ($("#_115_mf32k_day_month").val() != "" || $("#_116_mf32k_number_of_days_months").val() != "" || $("#_117_mf32k_code").val() != "" || $("#_118_mf32k_currency").val() != "" || $("#_119_mf32k_amount").val() != ""){
            $("#type_mf32_face_amount_of_document").val("k").attr("selected",true);
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").show();
            $("#_110_mf32a_date").attr("disabled", true);
            $("#_111_mf32a_currency").attr("disabled", true);
            $("#_112_mf32a_amount").attr("disabled", true);
            $("#_113_mf32b_currency").attr("disabled", true);
            $("#_114_mf32b_amount").attr("disabled", true);
            $("#_115_mf32k_day_month").attr("disabled", false);
            $("#_116_mf32k_number_of_days_months").attr("disabled", false);
            $("#_117_mf32k_code").attr("disabled", false);
            $("#_118_mf32k_currency").attr("disabled", false);
            $("#_119_mf32k_amount").attr("disabled", false);
        } else{
            $("#div_mf32a_").hide();
            $("#div_mf32b_").hide();
            $("#div_mf32k_").hide();
            $("#_110_mf32a_date").attr("disabled", true);
            $("#_111_mf32a_currency").attr("disabled", true);
            $("#_112_mf32a_amount").attr("disabled", true);
            $("#_113_mf32b_currency").attr("disabled", true);
            $("#_114_mf32b_amount").attr("disabled", true);
            $("#_115_mf32k_day_month").attr("disabled", true);
            $("#_116_mf32k_number_of_days_months").attr("disabled", true);
            $("#_117_mf32k_code").attr("disabled", true);
            $("#_118_mf32k_currency").attr("disabled", true);
            $("#_119_mf32k_amount").attr("disabled", true);
        } 
    });
</script>