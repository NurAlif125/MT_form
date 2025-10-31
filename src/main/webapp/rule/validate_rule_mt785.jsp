<%-- 
    Document   : validate_rule_mt785
    Created on : Feb 26, 2024, 2:59:40 PM
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
                _010_mf20_undertaking_number: "required",
                

                //mf52_a_d
                _012_mf52a_party_identifier: "required",
                _013_mf52a_identifier_code: "required",
                _014_mf52d_party_identifier: "required",
                _015_mf52d_name_and_address: "required",
                
                //mf31c
                _020_mf31c_date_of_issue: "required",
                               

                //mf359
                _021_mf59_account: "required",
                _022_mf59_name_and_address: "required",
                
                _023_mf59a_account "required",
                _024_mf59a_identifier_code "required",
                


            },
            messages: {
                sender_logical_terminal: {required: "sender_logical_terminal harus diisi..!!"},
                receiver_institution: {required: "receiver_institution harus diisi..!!"},
                priority: {required: "priority harus diisi..!!"},
                _010_mf20_undertaking_number: {required: "mf20_undertaking_number harus diisi..!!"},
               
                
                _012_mf52a_party_identifier: {required: "mf52a_party_identifier harus diisi..!!"},
                _013_mf52a_identifier_code: {required: "mf52a_identifier_code harus diisi..!!"},
                _014_mf52d_party_identifier: {required: "mf52d_party_identifier harus diisi..!!"},
                _015_mf52d_name_and_address: {required: "mf52d_name_and_address harus diisi..!!"},
                
                _020_mf31c_date_of_issue: {required: "mf31c_date_of_issue harus diisi..!!"},
                _021_mf59_account: {required: "mf59_account harus diisi..!!"},
                _022_mf59_name_and_address: {required: "mf59_name_and_address harus diisi..!!"},
                
                _023_mf59a_account: {required: "mf59a_accoun harus diisi..!!"},

                _024_mf59a_identifier_code: {required: "mf59a_identifier_code harus diisi..!!"},
                
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
        
        //mf59/59a sequence b
        $("#div_mf59_seq_b").hide();
        $("#div_mf59a_seq_b").hide();
        $("#_021_mf59_account").attr("disabled", true);
        $("#_022_mf59_name_and_address").attr("disabled", true);
        $("#_023_mf59a_account").attr("disabled", true);
        $("#_024_mf59a_identifier_code").attr("disabled", true);
        $("#type_of59_59a_seq_b").change(function() {
            if ( $("#type_of59_59a_seq_b").val() == "59"){
                $("#div_mf59_seq_b").show();
                $("#div_mf59a_seq_b").hide();
                $("#_021_mf59_account").attr("disabled", false);
                $("#_022_mf59_name_and_address").attr("disabled", false);
                $("#_023_mf59a_account").attr("disabled", true);
                $("#_024_mf59a_identifier_code").attr("disabled", true);
            } else if ( $("#type_of59_59a_seq_b").val() == "59a"){
                $("#div_mf59_seq_b").hide();
                $("#div_mf59a_seq_b").show();
                $("#_021_mf59_account").attr("disabled", true);
                $("#_022_mf59_name_and_address").attr("disabled", true);
                $("#_023_mf59a_account").attr("disabled", false);
                $("#_024_mf59a_identifier_code").attr("disabled", false);
            } else{
                $("#div_mf59_seq_b").hide();
                $("#div_mf59a_seq_b").hide();
                $("#_021_mf59_account").attr("disabled", true);
                $("#_022_mf59_name_and_address").attr("disabled", true);
                $("#_023_mf59a_account").attr("disabled", true);
                $("#_024_mf59a_identifier_code").attr("disabled", true);
            }
        });
        
         //mf56
        $("#div_of56_a_d").hide();
        $("#div_of56_d_d").hide();
        $("#div_of56_j_d").hide();
        $("#_025_of56a_party_identifier").attr("disabled", true);
        $("#_026_of56a_identifier_code").attr("disabled", true);
        $("#_027_of56d_party_identifier").attr("disabled", true);
        $("#_028_of56d_name_and_address").attr("disabled", true);
        $("#_386_of56j_party_identification").attr("disabled", true);
        $("#type_of56_d").change(function () {
            if ($("#type_of56_d").val() == "a") {
                $("#div_of56_a_d").show();
                $("#div_of56_d_d").hide();
                $("#div_of56_j_d").hide();
                $("#_025_of56a_party_identifier").attr("disabled", false);
                $("#_026_of56a_identifier_code").attr("disabled", false);
                $("#_027_of56d_party_identifier").attr("disabled", true);
                $("#_028_of56d_name_and_address").attr("disabled", true);
                $("#_386_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_d").val() == "d") {
                $("#div_of56_a_d").hide();
                $("#div_of56_d_d").show();
                $("#div_of56_j_d").hide();
                $("#_025_of56a_party_identifier").attr("disabled", true);
                $("#_026_of56a_identifier_code").attr("disabled", true);
                $("#_027_of56d_party_identifier").attr("disabled", false);
                $("#_028_of56d_name_and_address").attr("disabled", false);
                $("#_386_of56j_party_identification").attr("disabled", true);
            } else if ($("#type_of56_d").val() == "j") {
                $("#div_of56_a_d").hide();
                $("#div_of56_d_d").hide();
                $("#div_of56_j_d").show();
                $("#_025_of56a_party_identifier").attr("disabled", true);
                $("#_026_of56a_identifier_code").attr("disabled", true);
                $("#_027_of56d_party_identifier").attr("disabled", true);
                $("#_028_of56d_name_and_address").attr("disabled", true);
                $("#_386_of56j_party_identification").attr("disabled", false);
            } else {
                $("#div_of56_a_d").hide();
                $("#div_of56_d_d").hide();
                $("#div_of56_j_d").hide();
                $("#_025_of56a_party_identifier").attr("disabled", true);
                $("#_026_of56a_identifier_code").attr("disabled", true);
                $("#_027_of56d_party_identifier").attr("disabled", true);
                $("#_028_of56d_name_and_address").attr("disabled", true);
                $("#_386_of56j_party_identification").attr("disabled", true);
            }
        });
        //end of the line
        //mf57
        $("#div_mf57_a").hide();
        $("#div_mf57_d").hide();
        $("#div_mf57_j_d").hide();
        $("#_030_of57a_party_identifier").attr("disabled", true);
        $("#_031_of57a_identifier_code").attr("disabled", true);
        $("#_032_of57d_party_identifier").attr("disabled", true);
        $("#_033_of57d_name_and_address").attr("disabled", true);
        $("#_396_mf57j_party_identification").attr("disabled", true);
        $("#type_mf57_").change(function () {
            if ($("#type_mf57_").val() == "a") {
                $("#div_mf57_a").show();
                $("#div_mf57_d").hide();
                $("#div_mf57_j_d").hide();
                $("#_030_of57a_party_identifier").attr("disabled", false);
                $("#_031_of57a_identifier_code").attr("disabled", false);
                $("#_032_of57d_party_identifier").attr("disabled", true);
                $("#_033_of57d_name_and_address").attr("disabled", true);
                $("#_396_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_").val() == "d") {
                $("#div_mf57_a").hide();
                $("#div_mf57_d").show();
                $("#div_mf57_j_d").hide();
                $("#_030_of57a_party_identifier").attr("disabled", true);
                $("#_031_of57a_identifier_code").attr("disabled", true);
                $("#_032_of57d_party_identifier").attr("disabled", false);
                $("#_033_of57d_name_and_address").attr("disabled", false);
                $("#_396_mf57j_party_identification").attr("disabled", true);
            } else if ($("#type_mf57_").val() == "j") {
                $("#div_mf57_a").hide();
                $("#div_mf57_d").hide();
                $("#div_mf57_j_d").show();
                $("#_030_of57a_party_identifier").attr("disabled", true);
                $("#_031_of57a_identifier_code").attr("disabled", true);
                $("#_032_of57d_party_identifier").attr("disabled", true);
                $("#_033_of57d_name_and_address").attr("disabled", true);
                $("#_396_mf57j_party_identification").attr("disabled", false);
            } else {
                $("#div_mf57_a").hide();
                $("#div_mf57_d").hide();
                $("#div_mf57_j_d").hide();
                $("#_030_of57a_party_identifier").attr("disabled", true);
                $("#_031_of57a_identifier_code").attr("disabled", true);
                $("#_032_of57d_party_identifier").attr("disabled", true);
                $("#_033_of57d_name_and_address").attr("disabled", true);
                $("#_396_mf57j_party_identification").attr("disabled", true);
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
        
         
        
        //of56_a_d_j
        if ($("#_025_of56a_party_identifier").val() != "" || $("#_026_of56a_identifier_code").val() != "") {
            $("#type_of56_d").val("a").attr("selected", true);
            $("#div_of56_a_d").show();
            $("#div_of56_d_d").hide();
            $("#div_of56_j_d").hide();
            $("#_025_of56a_party_identifier").attr("disabled", false);
            $("#_026_of56a_identifier_code").attr("disabled", false);
            $("#_027_of56d_party_identifier").attr("disabled", true);
            $("#_028_of56d_name_and_address").attr("disabled", true);
            $("#_386_of56j_party_identification").attr("disabled", true);
        } else if ($("#_027_of56d_party_identifier").val() != "" || $("#_028_of56d_name_and_address").val() != "") {
            $("#type_of56_d").val("d").attr("selected", true);
            $("#div_of56_a_d").hide();
            $("#div_of56_d_d").show();
            $("#div_of56_j_d").hide();
            $("#_025_of56a_party_identifier").attr("disabled", true);
            $("#_026_of56a_identifier_code").attr("disabled", true);
            $("#_027_of56d_party_identifier").attr("disabled", false);
            $("#_028_of56d_name_and_address").attr("disabled", false);
            $("#_386_of56j_party_identification").attr("disabled", true);
        } else if ($("#_386_of56j_party_identification").val() != "") {
            $("#type_of56_d").val("j").attr("selected", true);
            $("#div_of56_a_d").hide();
            $("#div_of56_d_d").hide();
            $("#div_of56_j_d").show();
            $("#_025_of56a_party_identifier").attr("disabled", true);
            $("#_026_of56a_identifier_code").attr("disabled", true);
            $("#_027_of56d_party_identifier").attr("disabled", true);
            $("#_028_of56d_name_and_address").attr("disabled", true);
            $("#_386_of56j_party_identification").attr("disabled", false);
        } else {
            $("#div_of56_a_d").hide();
            $("#div_of56_d_d").hide();
            $("#div_of56_j_d").hide();
            $("#_025_of56a_party_identifier").attr("disabled", true);
            $("#_026_of56a_identifier_code").attr("disabled", true);
            $("#_027_of56d_party_identifier").attr("disabled", true);
            $("#_028_of56d_name_and_address").attr("disabled", true);
            $("#_386_of56j_party_identification").attr("disabled", true);
        }
        
          //mf59/59a sequence b
        if ($("#_021_mf59_account").val() != "" || $("#_022_mf59_name_and_address").val() != ""){
            $("#type_of59_59a_seq_b").val("59").attr("selected",true);
            $("#div_mf59_seq_b").show();
            $("#div_mf59a_seq_b").hide();
            $("#_021_mf59_account").attr("disabled", false);
            $("#_022_mf59_name_and_address").attr("disabled", false);
            $("#_023_mf59a_account").attr("disabled", true);
            $("#_024_mf59a_identifier_code").attr("disabled", true);
        } else if ($("#_023_mf59a_account").val() != "" || $("#_024_mf59a_identifier_code").val() != ""){
            $("#type_of59_59a_seq_b").val("59a").attr("selected",true);
            $("#div_mf59_seq_b").hide();
            $("#div_mf59a_seq_b").show();
            $("#_021_mf59_account").attr("disabled", true);
            $("#_022_mf59_name_and_address").attr("disabled", true);
            $("#_023_mf59a_account").attr("disabled", false);
            $("#_024_mf59a_identifier_code").attr("disabled", false);
        } else{
            $("#div_mf59_seq_b").hide();
            $("#div_mf59a_seq_b").hide();
            $("#_021_mf59_account").attr("disabled", true);
            $("#_022_mf59_name_and_address").attr("disabled", true);
            $("#_023_mf59a_account").attr("disabled", true);
            $("#_024_mf59a_identifier_code").attr("disabled", true);
        }

        //end of the line
        //mf57_a_d_j
        if ($("#_030_of57a_party_identifier").val() != "" || $("#_031_of57a_identifier_code").val() != "") {
            $("#type_mf57_").val("a").attr("selected", true);
            $("#div_mf57_a").show();
            $("#div_mf57_d").hide();
            $("#div_mf57_j_d").hide();
            $("#_030_of57a_party_identifier").attr("disabled", false);
            $("#_031_of57a_identifier_code").attr("disabled", false);
            $("#_032_of57d_party_identifier").attr("disabled", true);
            $("#_033_of57d_name_and_address").attr("disabled", true);
            $("#_396_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_032_of57d_party_identifier").val() != "" || $("#_033_of57d_name_and_address").val() != "") {
            $("#type_mf57_").val("d").attr("selected", true);
            $("#div_mf57_a").hide();
            $("#div_mf57_d").show();
            $("#div_mf57_j_d").hide();
            $("#_030_of57a_party_identifier").attr("disabled", true);
            $("#_031_of57a_identifier_code").attr("disabled", true);
            $("#_032_of57d_party_identifier").attr("disabled", false);
            $("#_033_of57d_name_and_address").attr("disabled", false);
            $("#_396_mf57j_party_identification").attr("disabled", true);
        } else if ($("#_396_mf57j_party_identification").val() != "") {
            $("#type_mf57_").val("j").attr("selected", true);
            $("#div_mf57_a").hide();
            $("#div_mf57_d").hide();
            $("#div_mf57_j_d").show();
            $("#_030_of57a_party_identifier").attr("disabled", true);
            $("#_031_of57a_identifier_code").attr("disabled", true);
            $("#_032_of57d_party_identifier").attr("disabled", true);
            $("#_033_of57d_name_and_address").attr("disabled", true);
            $("#_396_mf57j_party_identification").attr("disabled", false);
        } else {
            $("#div_mf57_a").hide();
            $("#div_mf57_d").hide();
            $("#div_mf57_j_d").hide();
            $("#_030_of57a_party_identifier").attr("disabled", true);
            $("#_031_of57a_identifier_code").attr("disabled", true);
            $("#_032_of57d_party_identifier").attr("disabled", true);
            $("#_033_of57d_name_and_address").attr("disabled", true);
            $("#_396_mf57j_party_identification").attr("disabled", true);
        }
        
    });
</script>


