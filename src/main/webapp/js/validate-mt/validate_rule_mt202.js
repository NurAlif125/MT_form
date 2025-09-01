function loadCss(filename) {
  var link = document.createElement("link");
  link.rel = "stylesheet";
  link.type = "text/css";
  link.href = filename;
  document.head.appendChild(link);
}


    $(document).ready(function() {
        let validator = $("#form1").validate({
            ignore: [],  
            onkeyup: false,          // Nonaktifkan validasi saat mengetik
            onfocusout: false, 
            rules: {
                //header
                sender_logical_terminal: "required",
                receiver_institution: "required",
                priority: "required",

                //body
                _010_mf20_sender_reference: "required",
                _011_mf21_: "required",

                //mf32a
                _060_mf32a_date: "required",
                _061_mf32a_currency: "required",
                _062_mf32a_amount: "required",

                //of52
                _111_of52a_identifier_code: "required",
                _114_of52d_name_address: "required",

                //of53
                _121_of53a_identifier_code: "required",
                _126_of53d_name_address: "required",

                //of54
                _131_of54a_identifier_code: "required",
                _136_of54d_name_address: "required",

                //of56
                _161_of56a_identifier_code: "required",
                _165_of56d_name_address: "required",

                //of57
                _171_of57a_identifier_code: "required",
                _177_of57d_name_address: "required",

                //of58
                type_of58_: "required",
                _181_of58a_identifier_code: "required",
                _184_of58d_name_address: "required",
                type_of58_: "required"
            },
            messages: {
                //header
                sender_logical_terminal: {required: "sender_logical_terminal must be filled..!!"},
                receiver_institution: {required: "receiver_institution must be filled..!!"},
                priority: {required: "priority must be filled..!!"},
                
                //body
                _010_mf20_sender_reference: {required: "mf20 must be filled..!!"},
                
                _011_mf21_: {required: "mf21 must be filled..!!"},

                //mf32a
                _060_mf32a_date: {required: "MF32a Date must be filled..!!"},
                _061_mf32a_currency: {required: "MF32a Currency must be filled..!!"},
                _062_mf32a_amount: {required: "MF32a Amount must be filled..!!"},

                //of52
                _111_of52a_identifier_code: {required: "Of52A Identifier Code must be filled..!!"},
                _114_of52d_name_address: {required: "Of52D Name Address must be filled..!!"},

                //of53
                _121_of53a_identifier_code: {required: "Of53A Identifier Code must be filled..!!"},
                _126_of53d_name_address: {required: "Of53D Name Address must be filled..!!"},

                //of54
                _131_of54a_identifier_code: {required: "Of54A Identifier Code must be filled..!!"},
                _136_of54d_name_address: {required: "Of54D Name Address must be filled..!!"},

                //of56
                _161_of56a_identifier_code: {required: "Of56A Identifier Code must be filled..!!"},
                _165_of56d_name_address: {required: "Of56D Name Address must be filled..!!"},

                //of57
                _171_of57a_identifier_code: {required: "Of57A Identifier Code must be filled..!!"},
                _177_of57d_name_address: {required: "Of57D Name Address must be filled..!!"},

                //of58
                type_of58_: {required: "Mf58 must be filled..!!"},
                _181_of58a_identifier_code: {required: "Mf58A Identifier Code must be filled..!!"},
                _184_of58d_name_address: {required: "Of57D Name Address must be filled..!!"}
                
            },
            errorPlacement: function (error, element) {
                error.insertAfter(element);
//                alert(error.html());
                $("#tab-validate").removeAttr("hidden");
//                console.log(error.html())
            },
            showErrors: function (errorMap, errorList) {
                this.defaultShowErrors();
                
                $("#tab-validate").removeAttr("hidden");
                 
                $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css("display", "none");
                $("#view8").css("display", "block");
                $('#tab-view1').removeClass("selected").removeAttr('class');
                $('#tab-view2').removeClass("selected").removeAttr('class');
                $('#tab-view3').removeClass("selected").removeAttr('class');
                $('#tab-view4').removeClass("selected").removeAttr('class');
                $('#tab-view5').removeClass("selected").removeAttr('class');
                $('#tab-view6').removeClass("selected").removeAttr('class');
                $('#tab-view7').removeClass("selected").removeAttr('class');
                $('#tab-validate').addClass("selected");

                let errorContainer = document.getElementById("error-container");
                
                if (errorList.length === 0) {
                    errorContainer.innerHTML = ""; 
//                    return;
                } 
                
                let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                    <tr style="background:#d6d6d6;">
                                    <th>Type</th>
                                    <th>Location</th>
                                    <th>Node</th>
                                    <th>Message</th></tr>`;

                    
                errorList.forEach(errors => {
                    let inputID = errors.element.id || "";
                    let locationTab = errors.element.getAttribute("location") || "";
                    let inputType = errors.element.getAttribute("input_type") || "";

                    tableHTML += '<tr class="error__row" data-input-id="'+inputID+'" content-body="'+locationTab+'" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
                    tableHTML += '<td style="padding: 5px;">Error</td>';
                    tableHTML += '<td style="padding: 5px;">'+locationTab+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+inputType+'</td>';
                    tableHTML += '<td style="padding: 5px;">'+errors.message+'</td></tr>';
                });

                tableHTML += `</table>`;
                errorContainer.innerHTML = tableHTML; 
                
                document.querySelectorAll(".error__row").forEach(row => {
                    row.addEventListener("click", function () {
                        let targetRow = event.target.closest(".error__row"); 
                        let inputId = this.getAttribute("data-input-id");
                        let tabContentGroup = this.getAttribute("content-body");
                        
                    if (targetRow) {
                        let input = document.getElementById(inputId);
                        if (input) {
                            if(tabContentGroup == "Header") {
                                $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $("#view1").css("display", "block");
                                $('#tab-view1').addClass("selected");
                                $('#tab-view2').removeClass("selected").removeAttr('class');
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                            } 
                            else if (tabContentGroup == "Body") {
                                 $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css("display", "none");
                                $('#tab-view1').removeClass("selected").removeAttr('class');
                                $('#tab-view2').addClass("selected");
                                $('#tab-view3').removeClass("selected").removeAttr('class');
                                $('#tab-view4').removeClass("selected").removeAttr('class');
                                $('#tab-view5').removeClass("selected").removeAttr('class');
                                $('#tab-view6').removeClass("selected").removeAttr('class');
                                $('#tab-view7').removeClass("selected").removeAttr('class');
                                $('#tab-validate').removeClass("selected").removeAttr('class');
                                $("#view2").css("display", "block");
                                
                            }
                            
                            input.focus();
                        } else {
                            console.log("nothing input element")
                        }
                    }
                    });
                });
            },
            
        });
        
        $("#btn-validate").click(function () {
            let isValid = $("#form1").valid(); 
            if (isValid) {
                alert("All inputs are valid!");
            } 
        });

        $("#submit_mt").click(function (e) {
            e.preventDefault();
            let isValid = $("#form1").valid(); 
            if (isValid) {  
                $("#form1").submit(); 
            } else {
                alert("There are still errors! Please fix them before saving.");
            }
        });
        
        $.validator.addMethod("regex", function(value, element, param) {
            return this.optional(element) || param.test(value); 
        }, "Format tidak valid");
        
    });


loadCss("../../css/validate.css");


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
        $("#div_of52a_").hide();
        $("#div_of52d_").hide();
        $("#_110_of52a_party_identifier").attr("disabled", true);
        $("#_111_of52a_identifier_code").attr("disabled", true);
        $("#_113_of52d_party_identifier").attr("disabled", true);
        $("#_114_of52d_name_address").attr("disabled", true);
        $("#type_of52_").change(function() {
            if ( $("#type_of52_").val() == "a"){
                $("#div_of52a_").show();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", false);
                $("#_111_of52a_identifier_code").attr("disabled", false);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            } else if ( $("#type_of52_").val() == "d"){
                $("#div_of52a_").hide();
                $("#div_of52d_").show();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", false);
                $("#_114_of52d_name_address").attr("disabled", false);
            } else{
                $("#div_of52a_").hide();
                $("#div_of52d_").hide();
                $("#_110_of52a_party_identifier").attr("disabled", true);
                $("#_111_of52a_identifier_code").attr("disabled", true);
                $("#_113_of52d_party_identifier").attr("disabled", true);
                $("#_114_of52d_name_address").attr("disabled", true);
            }
        });

        //of53_a_b_d
        $("#div_of53a_").hide();
        $("#div_of53b_").hide();
        $("#div_of53d_").hide();
        $("#_120_of53a_party_identifier").attr("disabled", true);
        $("#_121_of53a_identifier_code").attr("disabled", true);
        $("#_123_of53b_party_identifier").attr("disabled", true);
        $("#_124_of53b_location").attr("disabled", true);
        $("#_125_of53d_party_identifier").attr("disabled", true);
        $("#_126_of53d_name_address").attr("disabled", true);
        $("#type_of53_").change(function() {
            if ( $("#type_of53_").val() == "a"){
                $("#div_of53a_").show();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", false);
                $("#_121_of53a_identifier_code").attr("disabled", false);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_").val() == "b"){
                $("#div_of53a_").hide();
                $("#div_of53b_").show();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", false);
                $("#_124_of53b_location").attr("disabled", false);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            } else if ( $("#type_of53_").val() == "d"){
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").show();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", false);
                $("#_126_of53d_name_address").attr("disabled", false);
            } else{
                $("#div_of53a_").hide();
                $("#div_of53b_").hide();
                $("#div_of53d_").hide();
                $("#_120_of53a_party_identifier").attr("disabled", true);
                $("#_121_of53a_identifier_code").attr("disabled", true);
                $("#_123_of53b_party_identifier").attr("disabled", true);
                $("#_124_of53b_location").attr("disabled", true);
                $("#_125_of53d_party_identifier").attr("disabled", true);
                $("#_126_of53d_name_address").attr("disabled", true);
            }
        });

        //of54_a_b_d
        $("#div_of54a_").hide();
        $("#div_of54b_").hide();
        $("#div_of54d_").hide();
        $("#_130_of54a_party_identifier").attr("disabled", true);
        $("#_131_of54a_identifier_code").attr("disabled", true);
        $("#_133_of54b_party_identifier").attr("disabled", true);
        $("#_134_of54b_location").attr("disabled", true);
        $("#_135_of54d_party_identifier").attr("disabled", true);
        $("#_136_of54d_name_address").attr("disabled", true);
        $("#type_of54_").change(function() {
            if ( $("#type_of54_").val() == "a"){
                $("#div_of54a_").show();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", false);
                $("#_131_of54a_identifier_code").attr("disabled", false);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_").val() == "b"){
                $("#div_of54a_").hide();
                $("#div_of54b_").show();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", false);
                $("#_134_of54b_location").attr("disabled", false);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            } else if ( $("#type_of54_").val() == "d"){
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").show();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", false);
                $("#_136_of54d_name_address").attr("disabled", false);
            } else{
                $("#div_of54a_").hide();
                $("#div_of54b_").hide();
                $("#div_of54d_").hide();
                $("#_130_of54a_party_identifier").attr("disabled", true);
                $("#_131_of54a_identifier_code").attr("disabled", true);
                $("#_133_of54b_party_identifier").attr("disabled", true);
                $("#_134_of54b_location").attr("disabled", true);
                $("#_135_of54d_party_identifier").attr("disabled", true);
                $("#_136_of54d_name_address").attr("disabled", true);
            }
        });

        //of56_a_d
        $("#div_of56a_").hide();
        $("#div_of56d_").hide();
        $("#_160_of56a_party_identifier").attr("disabled", true);
        $("#_161_of56a_identifier_code").attr("disabled", true);
        $("#_164_of56d_party_identifier").attr("disabled", true);
        $("#_165_of56d_name_address").attr("disabled", true);
        $("#type_of56_").change(function() {
            if ( $("#type_of56_").val() == "a"){
                $("#div_of56a_").show();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", false);
                $("#_161_of56a_identifier_code").attr("disabled", false);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            } else if ( $("#type_of56_").val() == "d"){
                $("#div_of56a_").hide();
                $("#div_of56d_").show();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", false);
                $("#_165_of56d_name_address").attr("disabled", false);
            } else{
                $("#div_of56a_").hide();
                $("#div_of56d_").hide();
                $("#_160_of56a_party_identifier").attr("disabled", true);
                $("#_161_of56a_identifier_code").attr("disabled", true);
                $("#_164_of56d_party_identifier").attr("disabled", true);
                $("#_165_of56d_name_address").attr("disabled", true);
            }
        });

        //of57_a_b_d
        $("#div_of57a_").hide();
        $("#div_of57b_").hide();
        $("#div_of57d_").hide();
        $("#_170_of57a_party_identifier").attr("disabled", true);
        $("#_171_of57a_identifier_code").attr("disabled", true);
        $("#_173_of57b_party_identifier").attr("disabled", true);
        $("#_174_of57b_location").attr("disabled", true);
        $("#_176_of57d_party_identifier").attr("disabled", true);
        $("#_177_of57d_name_address").attr("disabled", true);
        $("#type_of57_").change(function() {
            if ( $("#type_of57_").val() == "a"){
                $("#div_of57a_").show();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", false);
                $("#_171_of57a_identifier_code").attr("disabled", false);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "b"){
                $("#div_of57a_").hide();
                $("#div_of57b_").show();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", false);
                $("#_174_of57b_location").attr("disabled", false);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            } else if ( $("#type_of57_").val() == "d"){
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").show();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", false);
                $("#_177_of57d_name_address").attr("disabled", false);
            } else{
                $("#div_of57a_").hide();
                $("#div_of57b_").hide();
                $("#div_of57d_").hide();
                $("#_170_of57a_party_identifier").attr("disabled", true);
                $("#_171_of57a_identifier_code").attr("disabled", true);
                $("#_173_of57b_party_identifier").attr("disabled", true);
                $("#_174_of57b_location").attr("disabled", true);
                $("#_176_of57d_party_identifier").attr("disabled", true);
                $("#_177_of57d_name_address").attr("disabled", true);
            }
        });

        //of58_a_d
        $("#div_of58a_").hide();
        $("#div_of58d_").hide();
        $("#_180_of58a_party_identifier").attr("disabled", true);
        $("#_181_of58a_identifier_code").attr("disabled", true);
        $("#_183_of58d_party_identifier").attr("disabled", true);
        $("#_184_of58d_name_address").attr("disabled", true);
        $("#type_of58_").change(function() {
            if ( $("#type_of58_").val() == "a"){
                $("#div_of58a_").show();
                $("#div_of58d_").hide();
                $("#_180_of58a_party_identifier").attr("disabled", false);
                $("#_181_of58a_identifier_code").attr("disabled", false);
                $("#_183_of58d_party_identifier").attr("disabled", true);
                $("#_184_of58d_name_address").attr("disabled", true);
            } else if ( $("#type_of58_").val() == "d"){
                $("#div_of58a_").hide();
                $("#div_of58d_").show();
                $("#_180_of58a_party_identifier").attr("disabled", true);
                $("#_181_of58a_identifier_code").attr("disabled", true);
                $("#_183_of58d_party_identifier").attr("disabled", false);
                $("#_184_of58d_name_address").attr("disabled", false);
            } else{
                $("#div_of58a_").hide();
                $("#div_of58d_").hide();
                $("#_180_of58a_party_identifier").attr("disabled", true);
                $("#_181_of58a_identifier_code").attr("disabled", true);
                $("#_183_of58d_party_identifier").attr("disabled", true);
                $("#_184_of58d_name_address").attr("disabled", true);
            }
        });
    });


//rule view
    $(document).ready(function(){
        //of13c
        if ($("#_022_of13c_code").val() != ""){
            $("#div_of13c_").show();
            $("#_022_of13c_code").attr("disabled", false);
        }else{
            $("#div_of13c_").hide();
            $("#_022_of13c_code").attr("disabled", true);
        }

        //of52_a_d
        if ($("#_110_of52a_party_identifier").val() != "" || $("#_111_of52a_identifier_code").val() != ""){
            $("#type_of52_").val("a").attr("selected",true);
            $("#div_of52a_").show();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", false);
            $("#_111_of52a_identifier_code").attr("disabled", false);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        } else if ($("#_113_of52d_party_identifier").val() != "" || $("#_114_of52d_name_address").val() != ""){
            $("#type_of52_").val("d").attr("selected",true);
            $("#div_of52a_").hide();
            $("#div_of52d_").show();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", false);
            $("#_114_of52d_name_address").attr("disabled", false);
        } else{
            $("#div_of52a_").hide();
            $("#div_of52d_").hide();
            $("#_110_of52a_party_identifier").attr("disabled", true);
            $("#_111_of52a_identifier_code").attr("disabled", true);
            $("#_113_of52d_party_identifier").attr("disabled", true);
            $("#_114_of52d_name_address").attr("disabled", true);
        }

        //of53_a_b_d
        if ($("#_120_of53a_party_identifier").val() != "" || $("#_121_of53a_identifier_code").val() != ""){
            $("#type_of53_").val("a").attr("selected",true);
            $("#div_of53a_").show();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", false);
            $("#_121_of53a_identifier_code").attr("disabled", false);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_123_of53b_party_identifier").val() != "" || $("#_124_of53b_location").val() != ""){
            $("#type_of53_").val("b").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").show();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", false);
            $("#_124_of53b_location").attr("disabled", false);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        } else if ($("#_125_of53d_party_identifier").val() != "" || $("#_126_of53d_name_address").val() != ""){
            $("#type_of53_").val("d").attr("selected",true);
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").show();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", false);
            $("#_126_of53d_name_address").attr("disabled", false);
        } else{
            $("#div_of53a_").hide();
            $("#div_of53b_").hide();
            $("#div_of53d_").hide();
            $("#_120_of53a_party_identifier").attr("disabled", true);
            $("#_121_of53a_identifier_code").attr("disabled", true);
            $("#_123_of53b_party_identifier").attr("disabled", true);
            $("#_124_of53b_location").attr("disabled", true);
            $("#_125_of53d_party_identifier").attr("disabled", true);
            $("#_126_of53d_name_address").attr("disabled", true);
        }

        //of54_a_b_d
        if ($("#_130_of54a_party_identifier").val() != "" || $("#_131_of54a_identifier_code").val() != ""){
            $("#type_of54_").val("a").attr("selected",true);
            $("#div_of54a_").show();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", false);
            $("#_131_of54a_identifier_code").attr("disabled", false);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_133_of54b_party_identifier").val() != "" || $("#_134_of54b_location").val() != ""){
            $("#type_of54_").val("b").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").show();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", false);
            $("#_134_of54b_location").attr("disabled", false);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        } else if ($("#_135_of54d_party_identifier").val() != "" || $("#_136_of54d_name_address").val() != ""){
            $("#type_of54_").val("d").attr("selected",true);
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").show();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", false);
            $("#_136_of54d_name_address").attr("disabled", false);
        } else{
            $("#div_of54a_").hide();
            $("#div_of54b_").hide();
            $("#div_of54d_").hide();
            $("#_130_of54a_party_identifier").attr("disabled", true);
            $("#_131_of54a_identifier_code").attr("disabled", true);
            $("#_133_of54b_party_identifier").attr("disabled", true);
            $("#_134_of54b_location").attr("disabled", true);
            $("#_135_of54d_party_identifier").attr("disabled", true);
            $("#_136_of54d_name_address").attr("disabled", true);
        }

        //of56_a_d
        if ($("#_160_of56a_party_identifier").val() != "" || $("#_161_of56a_identifier_code").val() != ""){
            $("#type_of56_").val("a").attr("selected",true);
            $("#div_of56a_").show();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", false);
            $("#_161_of56a_identifier_code").attr("disabled", false);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        } else if ($("#_164_of56d_party_identifier").val() != "" || $("#_165_of56d_name_address").val() != ""){
            $("#type_of56_").val("d").attr("selected",true);
            $("#div_of56a_").hide();
            $("#div_of56d_").show();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", false);
            $("#_165_of56d_name_address").attr("disabled", false);
        } else{
            $("#div_of56a_").hide();
            $("#div_of56d_").hide();
            $("#_160_of56a_party_identifier").attr("disabled", true);
            $("#_161_of56a_identifier_code").attr("disabled", true);
            $("#_164_of56d_party_identifier").attr("disabled", true);
            $("#_165_of56d_name_address").attr("disabled", true);
        }

        //of57_a_b_d
        if ($("#_170_of57a_party_identifier").val() != "" || $("#_171_of57a_identifier_code").val() != ""){
            $("#type_of57_").val("a").attr("selected",true);
            $("#div_of57a_").show();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", false);
            $("#_171_of57a_identifier_code").attr("disabled", false);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_173_of57b_party_identifier").val() != "" || $("#_174_of57b_location").val() != ""){
            $("#type_of57_").val("b").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").show();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", false);
            $("#_174_of57b_location").attr("disabled", false);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        } else if ($("#_176_of57d_party_identifier").val() != "" || $("#_177_of57d_name_address").val() != ""){
            $("#type_of57_").val("d").attr("selected",true);
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").show();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", false);
            $("#_177_of57d_name_address").attr("disabled", false);
        } else{
            $("#div_of57a_").hide();
            $("#div_of57b_").hide();
            $("#div_of57d_").hide();
            $("#_170_of57a_party_identifier").attr("disabled", true);
            $("#_171_of57a_identifier_code").attr("disabled", true);
            $("#_173_of57b_party_identifier").attr("disabled", true);
            $("#_174_of57b_location").attr("disabled", true);
            $("#_176_of57d_party_identifier").attr("disabled", true);
            $("#_177_of57d_name_address").attr("disabled", true);
        }

        //of58_a_d
        if ($("#_180_of58a_party_identifier").val() != "" || $("#_181_of58a_identifier_code").val() != ""){
            $("#type_of58_").val("a").attr("selected",true);
            $("#div_of58a_").show();
            $("#div_of58d_").hide();
            $("#_180_of58a_party_identifier").attr("disabled", false);
            $("#_181_of58a_identifier_code").attr("disabled", false);
            $("#_183_of58d_party_identifier").attr("disabled", true);
            $("#_184_of58d_name_address").attr("disabled", true);
        } else if ($("#_183_of58d_party_identifier").val() != "" || $("#_184_of58d_name_address").val() != ""){
            $("#type_of58_").val("d").attr("selected",true);
            $("#div_of58a_").hide();
            $("#div_of58d_").show();
            $("#_180_of58a_party_identifier").attr("disabled", true);
            $("#_181_of58a_identifier_code").attr("disabled", true);
            $("#_183_of58d_party_identifier").attr("disabled", false);
            $("#_184_of58d_name_address").attr("disabled", false);
        } else{
            $("#div_of58a_").hide();
            $("#div_of58d_").hide();
            $("#_180_of58a_party_identifier").attr("disabled", true);
            $("#_181_of58a_identifier_code").attr("disabled", true);
            $("#_183_of58d_party_identifier").attr("disabled", true);
            $("#_184_of58d_name_address").attr("disabled", true);
        }

    });

