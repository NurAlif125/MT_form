<%-- 
    Document   : validate_rule_mt300
    Created on : Sep 09, 2025, 11:33:21 AM
    Author     : Arsyad
--%>

<script type="text/javascript">
  $(document).ready(function () {
    let validator = $("#form1").validate({
      ignore: [],
      onkeyup: false, // Nonaktifkan validasi saat mengetik
      onfocusout: false,
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

        //                //mf22a
        _030_mf22a_type_of_operation: "required",
        //
        //                //mf22c
        _045_mf22c_common_reference: "required",
        //
        //              Mandatory Sequence A General Information
        //mf82
        type_mf82_: "required",
        _072_mf82a_identifier_code: "required",
        _075_mf82d_name_address: "required",
        _076_mf82j_party_identification: "required",
        //
        //                //mf87
        type_mf87_: "required",
        _082_mf87a_identifier_code: "required",
        _085_mf87d_name_address: "required",
        _086_mf87j_party_identification: "required",
        //
        //of83
        _092_of83a_identifier_code: "required",
        _095_of83d_name_address: "required",
        _096_of83j_party_identification: "required",

        //Mandatory Sequence B Transaction Details
        //MF30T
        _120_mf30t_trade_date: "required",

        //MF30V
        _130_mf30v_value_date: "required",

        //MF36
        _140_mf36_exchange_rate: "required",

        //Mandatory Subsequence B1 Amount Bought
        //MF32B
        _160_mf32b_currency: "required",
        _161_mf32b_amount: "required",

        //of53
        _172_of53a_identifier_code: "required",
        _175_of53d_name_address: "required",
        _176_of53j_party_identification: "required",

        //of56
        _182_of56a_identifier_code: "required",
        _185_of56d_name_address: "required",
        _186_of56j_party_identification: "required",

        //mf57
        type_mf57_: "required",
        _192_mf57a_identifier_code: "required",
        _195_mf57d_name_address: "required",
        _196_mf57j_party_identification: "required",

        //Mandatory Subsequence B2 Amount Sold
        //MF33B
        _200_mf33b_currency: "required",
        _201_mf33b_amount: "required",
        //
        //                //of53
        _212_of53a_identifier_code: "required",
        _215_of53d_name_address: "required",
        _216_of53j_party_identification: "required",
        //
        //                //of56
        _222_of56a_identifier_code: "required",
        _225_of56d_name_address: "required",
        _226_of56j_party_identification: "required",
        //
        //                //mf57
        type_mf57_b2: "required",
        _232_mf57a_identifier_code: "required",
        _235_mf57d_name_address: "required",
        _236_mf57j_party_identification: "required",
        //
        //                //of58
        _242_of58a_identifier_code: "required",
        _245_of58d_name_address: "required",
        _246_of58j_party_identification: "required",

        //Optional Sequence C Optional General Information

        //of84
        //_272_of84a_identifier_code: "required",
        //_277_of84d_name_and_address: "required",
        //_278_of84j_party_identification: "required",

        //of85
        //_282_of85a_identifier_code: "required",
        //_287_of85d_name_and_address: "required",
        //_288_of85_j_party_identification: "required",

        //of88
        //_292_of88a_identifier_code: "required",
        //_295_of88d_name_and_address: "required",
        //_296_of88j_party_identification: "required",

        //Optional Sequence D Split Settlement Details

        //MF17A
        _340_mf17a_buy_sell_indicator: "required",

        //MF32B
        _350_mf32b_currency: "required",
        _351_mf32b_amount: "required",

        //of53
        _372_of53a_identifier_code: "required",
        _375_of53d_name_address: "required",
        _376_of53j_party_identification: "required",

        //of56
        _372_of56a_identifier_code: "required",
        _375_of56d_name_address: "required",
        _376_of56j_party_identification: "required",

        //mf57
        //type_mf57_d: "required",
        //_382_mf57a_identifier_code: "required",
        //_385_mf57d_name_address: "required",
        //_386_mf57j_party_identification: "required",
        //
        //of58
        _392_of58a_identifier_code: "required",
        _395_of58d_name_address: "required",
        _396_of58j_party_identification: "required",

        //MF16A
        _400_mf16a_number_of_settlements: "required",

        //template
        template_name: "required",
      },
      messages: {
        sender_logical_terminal: {
          required: "sender_logical_terminal harus diisi..!!",
        },
        receiver_institution: {
          required: "receiver_institution harus diisi..!!",
        },
        priority: { required: "priority harus diisi..!!" },
        _010_mf20_sender_reference: {
          required: "mf20_sender_reference harus diisi..!!",
        },
        _030_mf22a_type_of_operation: {
          required: "mf22a_type_of_operation harus diisi..!!",
        },
        _045_mf22c_common_reference: {
          required: "mf22c_common_reference harus diisi..!!",
        },
        type_mf82_: { required: "type_mf82_ harus diisi..!!" },
        _072_mf82a_identifier_code: {
          required: "mf82a_identifier_code harus diisi..!!",
        },
        _075_mf82d_name_address: {
          required: "mf82d_name_address harus diisi..!!",
        },
        _076_mf82j_party_identification: {
          required: "mf82j_party_identification harus diisi..!!",
        },
        _082_mf87a_identifier_code: {
          required: "mf87a_identifier_code harus diisi..!!",
        },
        _085_mf87d_name_address: {
          required: "mf87d_name_address harus diisi..!!",
        },
        _086_mf87j_party_identification: {
          required: "mf87j_party_identification harus diisi..!!",
        },
        _092_of83a_identifier_code: {
          required: "of83a_identifier_code harus diisi..!!",
        },
        _095_of83d_name_address: {
          required: "of83d_name_address harus diisi..!!",
        },
        _096_of83j_party_identification: {
          required: "of83j_party_identification harus diisi..!!",
        },
        _120_mf30t_trade_date: { required: "mf30t_trade_date harus diisi..!!" },
        _130_mf30v_value_date: { required: "mf30v_value_date harus diisi..!!" },
        _140_mf36_exchange_rate: {
          required: "mf36_exchange_rate harus diisi..!!",
        },
        _160_mf32b_currency: { required: "mf32b_currency harus diisi..!!" },
        _161_mf32b_amount: { required: "mf32b_amount harus diisi..!!" },
        template_name: { required: "Template Name harus diisi..!!" },
      },
      errorPlacement: function (error, element) {
        error.insertAfter(element);
        $("#tab-validate").removeAttr("hidden");
      },
      showErrors: function (errorMap, errorList) {
        this.defaultShowErrors();

        console.log(errorMap)
        console.log(errorList)

        $("#tab-validate").removeAttr("hidden");

        $("#view1, #view2, #view3, #view4, #view5, #view6, #view7").css(
          "display",
          "none"
        );
        $("#view8").css("display", "block");
        $("#tab-view1").removeClass("selected").removeAttr("class");
        $("#tab-view2").removeClass("selected").removeAttr("class");
        $("#tab-view3").removeClass("selected").removeAttr("class");
        $("#tab-view4").removeClass("selected").removeAttr("class");
        $("#tab-view5").removeClass("selected").removeAttr("class");
        $("#tab-view6").removeClass("selected").removeAttr("class");
        $("#tab-view7").removeClass("selected").removeAttr("class");
        $("#tab-validate").addClass("selected");

        let errorContainer = document.getElementById("error-container");

        if (errorList.length === 0) {
          errorContainer.innerHTML = "";
        }

        let tableHTML = `<table border="0" style="width:100% !important; caption-side: bottom; font-size:8pt !important;border-collapse: collapse; border:1px gray solid;">
                                            <tr style="background:#d6d6d6;">
                                            <th>Type</th>
                                            <th>Location</th>
                                            <th>Node</th>
                                            <th>Message</th></tr>`;

        errorList.forEach((errors) => {
          let inputID = errors.element.id || "";
          let locationTab = errors.element.getAttribute("location") || "";
          let inputType = errors.element.getAttribute("input_type") || "";

          tableHTML +=
            '<tr class="error__row" data-input-id="' +
            inputID +
            '" content-body="' +
            locationTab +
            '" onmouseover="this.style.background=\'#f6f6f6\'" onmouseout="this.style.backgroundColor=\'transparent\'" style="cursor:pointer;">';
          tableHTML += '<td style="padding: 5px;">Error</td>';
          tableHTML += '<td style="padding: 5px;">' + locationTab + "</td>";
          tableHTML += '<td style="padding: 5px;">' + inputType + "</td>";
          tableHTML += '<td style="padding: 5px;">' + errors.message + "</td></tr>";
        });

        tableHTML += `</table>`;
        errorContainer.innerHTML = tableHTML;

        document.querySelectorAll(".error__row").forEach((row) => {
          row.addEventListener("click", function () {
            let targetRow = event.target.closest(".error__row");
            let inputId = this.getAttribute("data-input-id");
            let tabContentGroup = this.getAttribute("content-body");

            if (targetRow) {
              let input = document.getElementById(inputId);
              if (input) {
                if (tabContentGroup == "Header") {
                  $("#view2, #view3, #view4, #view5, #view6, #view7, #view8").css(
                    "display",
                    "none"
                  );
                  $("#view1").css("display", "block");
                  $("#tab-view1").addClass("selected");
                  $("#tab-view2").removeClass("selected").removeAttr("class");
                  $("#tab-view3").removeClass("selected").removeAttr("class");
                  $("#tab-view4").removeClass("selected").removeAttr("class");
                  $("#tab-view5").removeClass("selected").removeAttr("class");
                  $("#tab-view6").removeClass("selected").removeAttr("class");
                  $("#tab-view7").removeClass("selected").removeAttr("class");
                  $("#tab-validate").removeClass("selected").removeAttr("class");
                } else if (tabContentGroup == "Body") {
                  $("#view1, #view3, #view4, #view5, #view6, #view7, #view8").css(
                    "display",
                    "none"
                  );
                  $("#tab-view1").removeClass("selected").removeAttr("class");
                  $("#tab-view2").addClass("selected");
                  $("#tab-view3").removeClass("selected").removeAttr("class");
                  $("#tab-view4").removeClass("selected").removeAttr("class");
                  $("#tab-view5").removeClass("selected").removeAttr("class");
                  $("#tab-view6").removeClass("selected").removeAttr("class");
                  $("#tab-view7").removeClass("selected").removeAttr("class");
                  $("#tab-validate").removeClass("selected").removeAttr("class");
                  $("#view2").css("display", "block");
                }

                input.focus();
              } else {
                console.log("nothing input element");
              }
            }
          });
        });
      },
    });
  });

  $("#btn-validate").click(function () {
    let isValid = $("#form1").valid();
    if (isValid) {
      alert("Semua input valid!");
    }
  });

  $("#submit_mt").click(function (e) {
    e.preventDefault();
    let isValid = $("#form1").valid();
    if (isValid) {
      $("#form1").submit();
    } else {
      alert("Masih ada error! Harap perbaiki sebelum menyimpan.");
    }
  });

  $.validator.addMethod(
    "regex",
    function (value, element, param) {
      //this.optional(element) lewati validasi jika kosong dan param.test(value) check regex
      return this.optional(element) || param.test(value);
      // Jika tidak ada pesan khusus dalam messages tampilkan "Format tidak valid"
    },
    "Format tidak valid"
  );
</script>

<link rel="stylesheet" type="text/css" href="css/validate.css" />
<script type="text/javascript">
    $(document).ready(function () {
        $("#check_special_rate").hide();
        $("#special_rate").prop("required", false);
        $("#special_rate_checkbox").click(function () {
            if ($("#special_rate_checkbox").is(":checked")) {
                $("#check_special_rate").show();
                $("#special_rate").prop("required", false);
            } else {
                $("#check_special_rate").hide();
                $("#special_rate").prop("required", false);
            }
        });
    });
</script>

<script type="text/javascript">
  $(document).ready(function () {

    if ($("#special_rate").val() != "") {
        $("#special_rate_checkbox").prop("checked", true);
        $("#check_special_rate").show();
        $("#special_rate").prop("required", true);
    } else {
        $("#check_special_rate").hide();
        $("#special_rate").prop("required", false);
    }

    //mf82_a_d_j
    $("#div_mf82_a").hide();
    $("#div_mf82_d").hide();
    $("#div_mf82_j").hide();
    $("#_071_mf82a_party_identifier").attr("disabled", true);
    $("#_072_mf82a_identifier_code").attr("disabled", true);
    $("#_074_mf82d_party_identifier").attr("disabled", true);
    $("#_075_mf82d_name_address").attr("disabled", true);
    $("#_076_mf82j_party_identification").attr("disabled", true);
    $("#type_mf82_").change(function () {
      if ($("#type_mf82_").val() == "a") {
        $("#div_mf82_a").show();
        $("#div_mf82_d").hide();
        $("#div_mf82_j").hide();
        $("#_071_mf82a_party_identifier").attr("disabled", false);
        $("#_072_mf82a_identifier_code").attr("disabled", false);
        $("#_074_mf82d_party_identifier").attr("disabled", true);
        $("#_075_mf82d_name_address").attr("disabled", true);
        $("#_076_mf82j_party_identification").attr("disabled", true);
      } else if ($("#type_mf82_").val() == "d") {
        $("#div_mf82_a").hide();
        $("#div_mf82_d").show();
        $("#div_mf82_j").hide();
        $("#_071_mf82a_party_identifier").attr("disabled", true);
        $("#_072_mf82a_identifier_code").attr("disabled", true);
        $("#_074_mf82d_party_identifier").attr("disabled", false);
        $("#_075_mf82d_name_address").attr("disabled", false);
        $("#_076_mf82j_party_identification").attr("disabled", true);
      } else if ($("#type_mf82_").val() == "j") {
        $("#div_mf82_a").hide();
        $("#div_mf82_d").hide();
        $("#div_mf82_j").show();
        $("#_071_mf82a_party_identifier").attr("disabled", true);
        $("#_072_mf82a_identifier_code").attr("disabled", true);
        $("#_074_mf82d_party_identifier").attr("disabled", true);
        $("#_075_mf82d_name_address").attr("disabled", true);
        $("#_076_mf82j_party_identification").attr("disabled", false);
      } else {
        $("#div_mf82_a").hide();
        $("#div_mf82_d").hide();
        $("#div_mf82_j").hide();
        $("#_071_mf82a_party_identifier").attr("disabled", true);
        $("#_072_mf82a_identifier_code").attr("disabled", true);
        $("#_074_mf82d_party_identifier").attr("disabled", true);
        $("#_075_mf82d_name_address").attr("disabled", true);
        $("#_076_mf82j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //mf87_a_d_j
    $("#div_mf87_a").hide();
    $("#div_mf87_d").hide();
    $("#div_mf87_j").hide();
    $("#_081_mf87a_party_identifier").attr("disabled", true);
    $("#_082_mf87a_identifier_code").attr("disabled", true);
    $("#_084_mf87d_party_identifier").attr("disabled", true);
    $("#_085_mf87d_name_address").attr("disabled", true);
    $("#_086_mf87j_party_identification").attr("disabled", true);
    $("#type_mf87_").change(function () {
      if ($("#type_mf87_").val() == "a") {
        $("#div_mf87_a").show();
        $("#div_mf87_d").hide();
        $("#div_mf87_j").hide();
        $("#_081_mf87a_party_identifier").attr("disabled", false);
        $("#_082_mf87a_identifier_code").attr("disabled", false);
        $("#_084_mf87d_party_identifier").attr("disabled", true);
        $("#_085_mf87d_name_address").attr("disabled", true);
        $("#_086_mf87j_party_identification").attr("disabled", true);
      } else if ($("#type_mf87_").val() == "d") {
        $("#div_mf87_a").hide();
        $("#div_mf87_d").show();
        $("#div_mf87_j").hide();
        $("#_081_mf87a_party_identifier").attr("disabled", true);
        $("#_082_mf87a_identifier_code").attr("disabled", true);
        $("#_084_mf87d_party_identifier").attr("disabled", false);
        $("#_085_mf87d_name_address").attr("disabled", false);
        $("#_086_mf87j_party_identification").attr("disabled", true);
      } else if ($("#type_mf87_").val() == "j") {
        $("#div_mf87_a").hide();
        $("#div_mf87_d").hide();
        $("#div_mf87_j").show();
        $("#_081_mf87a_party_identifier").attr("disabled", true);
        $("#_082_mf87a_identifier_code").attr("disabled", true);
        $("#_084_mf87d_party_identifier").attr("disabled", true);
        $("#_085_mf87d_name_address").attr("disabled", true);
        $("#_086_mf87j_party_identification").attr("disabled", false);
      } else {
        $("#div_mf87_a").hide();
        $("#div_mf87_d").hide();
        $("#div_mf87_j").hide();
        $("#_081_mf87a_party_identifier").attr("disabled", true);
        $("#_082_mf87a_identifier_code").attr("disabled", true);
        $("#_084_mf87d_party_identifier").attr("disabled", true);
        $("#_085_mf87d_name_address").attr("disabled", true);
        $("#_086_mf87j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of83_a_d_j
    $("#div_of83_a").hide();
    $("#div_of83_d").hide();
    $("#div_of83_j").hide();
    $("#_091_of83a_party_identifier").attr("disabled", true);
    $("#_092_of83a_identifier_code").attr("disabled", true);
    $("#_094_of83d_party_identifier").attr("disabled", true);
    $("#_095_of83d_name_address").attr("disabled", true);
    $("#_096_of83j_party_identification").attr("disabled", true);
    $("#type_of83_").change(function () {
      if ($("#type_of83_").val() == "a") {
        $("#div_of83_a").show();
        $("#div_of83_d").hide();
        $("#div_of83_j").hide();
        $("#_091_of83a_party_identifier").attr("disabled", false);
        $("#_092_of83a_identifier_code").attr("disabled", false);
        $("#_094_of83d_party_identifier").attr("disabled", true);
        $("#_095_of83d_name_address").attr("disabled", true);
        $("#_096_of83j_party_identification").attr("disabled", true);
      } else if ($("#type_of83_").val() == "d") {
        $("#div_of83_a").hide();
        $("#div_of83_d").show();
        $("#div_of83_j").hide();
        $("#_091_of83a_party_identifier").attr("disabled", true);
        $("#_092_of83a_identifier_code").attr("disabled", true);
        $("#_094_of83d_party_identifier").attr("disabled", false);
        $("#_095_of83d_name_address").attr("disabled", false);
        $("#_096_of83j_party_identification").attr("disabled", true);
      } else if ($("#type_of83_").val() == "j") {
        $("#div_of83_a").hide();
        $("#div_of83_d").hide();
        $("#div_of83_j").show();
        $("#_091_of83a_party_identifier").attr("disabled", true);
        $("#_092_of83a_identifier_code").attr("disabled", true);
        $("#_094_of83d_party_identifier").attr("disabled", true);
        $("#_095_of83d_name_address").attr("disabled", true);
        $("#_096_of83j_party_identification").attr("disabled", false);
      } else {
        $("#div_of83_a").hide();
        $("#div_of83_d").hide();
        $("#div_of83_j").hide();
        $("#_091_of83a_party_identifier").attr("disabled", true);
        $("#_092_of83a_identifier_code").attr("disabled", true);
        $("#_094_of83d_party_identifier").attr("disabled", true);
        $("#_095_of83d_name_address").attr("disabled", true);
        $("#_096_of83j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //OF77H
    $("#check_of77h").hide();
    $("#_097_of77h_type_of_agreement").attr("disabled", true);
    $("#value_date_7").attr("disabled", true);
    $("#_099_of77h_version").attr("disabled", true);
    $("#type_date_version_checkbox").click(function () {
      if ($("#type_date_version_checkbox").is(":checked")) {
        $("#check_of77h").show();
        $("#_097_of77h_type_of_agreement").attr("disabled", false);
        $("#value_date_7").attr("disabled", false);
        $("#_099_of77h_version").attr("disabled", false);
      } else {
        $("#check_of77h").hide();
        $("#_097_of77h_type_of_agreement").attr("disabled", true);
        $("#value_date_7").attr("disabled", true);
        $("#_099_of77h_version").attr("disabled", true);
      }
    });
    //end of the line
    //of53_a_d_j
    $("#div_of53_a").hide();
    $("#div_of53_d").hide();
    $("#div_of53_j").hide();
    $("#_171_of53a_party_identifier").attr("disabled", true);
    $("#_172_of53a_identifier_code").attr("disabled", true);
    $("#_174_of53d_party_identifier").attr("disabled", true);
    $("#_175_of53d_name_address").attr("disabled", true);
    $("#_176_of53j_party_identification").attr("disabled", true);
    $("#type_of53_").change(function () {
      if ($("#type_of53_").val() == "a") {
        $("#div_of53_a").show();
        $("#div_of53_d").hide();
        $("#div_of53_j").hide();
        $("#_171_of53a_party_identifier").attr("disabled", false);
        $("#_172_of53a_identifier_code").attr("disabled", false);
        $("#_174_of53d_party_identifier").attr("disabled", true);
        $("#_175_of53d_name_address").attr("disabled", true);
        $("#_176_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_").val() == "d") {
        $("#div_of53_a").hide();
        $("#div_of53_d").show();
        $("#div_of53_j").hide();
        $("#_171_of53a_party_identifier").attr("disabled", true);
        $("#_172_of53a_identifier_code").attr("disabled", true);
        $("#_174_of53d_party_identifier").attr("disabled", false);
        $("#_175_of53d_name_address").attr("disabled", false);
        $("#_176_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_").val() == "j") {
        $("#div_of53_a").hide();
        $("#div_of53_d").hide();
        $("#div_of53_j").show();
        $("#_171_of53a_party_identifier").attr("disabled", true);
        $("#_172_of53a_identifier_code").attr("disabled", true);
        $("#_174_of53d_party_identifier").attr("disabled", true);
        $("#_175_of53d_name_address").attr("disabled", true);
        $("#_176_of53j_party_identification").attr("disabled", false);
      } else {
        $("#div_of53_a").hide();
        $("#div_of53_d").hide();
        $("#div_of53_j").hide();
        $("#_171_of53a_party_identifier").attr("disabled", true);
        $("#_172_of53a_identifier_code").attr("disabled", true);
        $("#_174_of53d_party_identifier").attr("disabled", true);
        $("#_175_of53d_name_address").attr("disabled", true);
        $("#_176_of53j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of56_a_d_j
    $("#div_of56_a").hide();
    $("#div_of56_d").hide();
    $("#div_of56_j").hide();
    $("#_181_of56a_party_identifier").attr("disabled", true);
    $("#_182_of56a_identifier_code").attr("disabled", true);
    $("#_184_of56d_party_identifier").attr("disabled", true);
    $("#_185_of56d_name_address").attr("disabled", true);
    $("#_186_of56j_party_identification").attr("disabled", true);
    $("#type_of56_").change(function () {
      if ($("#type_of56_").val() == "a") {
        $("#div_of56_a").show();
        $("#div_of56_d").hide();
        $("#div_of56_j").hide();
        $("#_181_of56a_party_identifier").attr("disabled", false);
        $("#_182_of56a_identifier_code").attr("disabled", false);
        $("#_184_of56d_party_identifier").attr("disabled", true);
        $("#_185_of56d_name_address").attr("disabled", true);
        $("#_186_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_").val() == "d") {
        $("#div_of56_a").hide();
        $("#div_of56_d").show();
        $("#div_of56_j").hide();
        $("#_181_of56a_party_identifier").attr("disabled", true);
        $("#_182_of56a_identifier_code").attr("disabled", true);
        $("#_184_of56d_party_identifier").attr("disabled", false);
        $("#_185_of56d_name_address").attr("disabled", false);
        $("#_186_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_").val() == "j") {
        $("#div_of56_a").hide();
        $("#div_of56_d").hide();
        $("#div_of56_j").show();
        $("#_181_of56a_party_identifier").attr("disabled", true);
        $("#_182_of56a_identifier_code").attr("disabled", true);
        $("#_184_of56d_party_identifier").attr("disabled", true);
        $("#_185_of56d_name_address").attr("disabled", true);
        $("#_186_of56j_party_identification").attr("disabled", false);
      } else {
        $("#div_of56_a").hide();
        $("#div_of56_d").hide();
        $("#div_of56_j").hide();
        $("#_181_of56a_party_identifier").attr("disabled", true);
        $("#_182_of56a_identifier_code").attr("disabled", true);
        $("#_184_of56d_party_identifier").attr("disabled", true);
        $("#_185_of56d_name_address").attr("disabled", true);
        $("#_186_of56j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //mf57_a_d_j
    $("#div_mf57_a").hide();
    $("#div_mf57_d").hide();
    $("#div_mf57_j").hide();
    $("#_191_mf57a_party_identifier").attr("disabled", true);
    $("#_192_mf57a_identifier_code").attr("disabled", true);
    $("#_194_mf57d_party_identifier").attr("disabled", true);
    $("#_195_mf57d_name_address").attr("disabled", true);
    $("#_196_mf57j_party_identification").attr("disabled", true);
    $("#type_mf57_").change(function () {
      if ($("#type_mf57_").val() == "a") {
        $("#div_mf57_a").show();
        $("#div_mf57_d").hide();
        $("#div_mf57_j").hide();
        $("#_191_mf57a_party_identifier").attr("disabled", false);
        $("#_192_mf57a_identifier_code").attr("disabled", false);
        $("#_194_mf57d_party_identifier").attr("disabled", true);
        $("#_195_mf57d_name_address").attr("disabled", true);
        $("#_196_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_").val() == "d") {
        $("#div_mf57_a").hide();
        $("#div_mf57_d").show();
        $("#div_mf57_j").hide();
        $("#_191_mf57a_party_identifier").attr("disabled", true);
        $("#_192_mf57a_identifier_code").attr("disabled", true);
        $("#_194_mf57d_party_identifier").attr("disabled", false);
        $("#_195_mf57d_name_address").attr("disabled", false);
        $("#_196_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_").val() == "j") {
        $("#div_mf57_a").hide();
        $("#div_mf57_d").hide();
        $("#div_mf57_j").show();
        $("#_191_mf57a_party_identifier").attr("disabled", true);
        $("#_192_mf57a_identifier_code").attr("disabled", true);
        $("#_194_mf57d_party_identifier").attr("disabled", true);
        $("#_195_mf57d_name_address").attr("disabled", true);
        $("#_196_mf57j_party_identification").attr("disabled", false);
      } else {
        $("#div_mf57_a").hide();
        $("#div_mf57_d").hide();
        $("#div_mf57_j").hide();
        $("#_191_mf57a_party_identifier").attr("disabled", true);
        $("#_192_mf57a_identifier_code").attr("disabled", true);
        $("#_194_mf57d_party_identifier").attr("disabled", true);
        $("#_195_mf57d_name_address").attr("disabled", true);
        $("#_196_mf57j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //Mandatory Subsequence B2 Amount Sold
    //of53_a_d_j
    $("#div_of53_a_b2").hide();
    $("#div_of53_d_b2").hide();
    $("#div_of53_j_b2").hide();
    $("#_211_of53a_party_identifier").attr("disabled", true);
    $("#_212_of53a_identifier_code").attr("disabled", true);
    $("#_214_of53d_party_identifier").attr("disabled", true);
    $("#_215_of53d_name_address").attr("disabled", true);
    $("#_216_of53j_party_identification").attr("disabled", true);
    $("#type_of53_b2").change(function () {
      if ($("#type_of53_b2").val() == "a") {
        $("#div_of53_a_b2").show();
        $("#div_of53_d_b2").hide();
        $("#div_of53_j_b2").hide();
        $("#_211_of53a_party_identifier").attr("disabled", false);
        $("#_212_of53a_identifier_code").attr("disabled", false);
        $("#_214_of53d_party_identifier").attr("disabled", true);
        $("#_215_of53d_name_address").attr("disabled", true);
        $("#_216_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_b2").val() == "d") {
        $("#div_of53_a_b2").hide();
        $("#div_of53_d_b2").show();
        $("#div_of53_j_b2").hide();
        $("#_211_of53a_party_identifier").attr("disabled", true);
        $("#_212_of53a_identifier_code").attr("disabled", true);
        $("#_214_of53d_party_identifier").attr("disabled", false);
        $("#_215_of53d_name_address").attr("disabled", false);
        $("#_216_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_b2").val() == "j") {
        $("#div_of53_a_b2").hide();
        $("#div_of53_d_b2").hide();
        $("#div_of53_j_b2").show();
        $("#_211_of53a_party_identifier").attr("disabled", true);
        $("#_212_of53a_identifier_code").attr("disabled", true);
        $("#_214_of53d_party_identifier").attr("disabled", true);
        $("#_215_of53d_name_address").attr("disabled", true);
        $("#_216_of53j_party_identification").attr("disabled", false);
      } else {
        $("#div_of53_a_b2").hide();
        $("#div_of53_d_b2").hide();
        $("#div_of53_j_b2").hide();
        $("#_211_of53a_party_identifier").attr("disabled", true);
        $("#_212_of53a_identifier_code").attr("disabled", true);
        $("#_214_of53d_party_identifier").attr("disabled", true);
        $("#_215_of53d_name_address").attr("disabled", true);
        $("#_216_of53j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of56_a_d_j
    $("#div_of56_a_b2").hide();
    $("#div_of56_d_b2").hide();
    $("#div_of56_j_b2").hide();
    $("#_221_of56a_party_identifier").attr("disabled", true);
    $("#_222_of56a_identifier_code").attr("disabled", true);
    $("#_224_of56d_party_identifier").attr("disabled", true);
    $("#_225_of56d_name_address").attr("disabled", true);
    $("#_226_of56j_party_identification").attr("disabled", true);
    $("#type_of56_b2").change(function () {
      if ($("#type_of56_b2").val() == "a") {
        $("#div_of56_a_b2").show();
        $("#div_of56_d_b2").hide();
        $("#div_of56_j_b2").hide();
        $("#_221_of56a_party_identifier").attr("disabled", false);
        $("#_222_of56a_identifier_code").attr("disabled", false);
        $("#_224_of56d_party_identifier").attr("disabled", true);
        $("#_225_of56d_name_address").attr("disabled", true);
        $("#_226_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_b2").val() == "d") {
        $("#div_of56_a_b2").hide();
        $("#div_of56_d_b2").show();
        $("#div_of56_j_b2").hide();
        $("#_221_of56a_party_identifier").attr("disabled", true);
        $("#_222_of56a_identifier_code").attr("disabled", true);
        $("#_224_of56d_party_identifier").attr("disabled", false);
        $("#_225_of56d_name_address").attr("disabled", false);
        $("#_226_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_b2").val() == "j") {
        $("#div_of56_a_b2").hide();
        $("#div_of56_d_b2").hide();
        $("#div_of56_j_b2").show();
        $("#_221_of56a_party_identifier").attr("disabled", true);
        $("#_222_of56a_identifier_code").attr("disabled", true);
        $("#_224_of56d_party_identifier").attr("disabled", true);
        $("#_225_of56d_name_address").attr("disabled", true);
        $("#_226_of56j_party_identification").attr("disabled", false);
      } else {
        $("#div_of56_a_b2").hide();
        $("#div_of56_d_b2").hide();
        $("#div_of56_j_b2").hide();
        $("#_221_of56a_party_identifier").attr("disabled", true);
        $("#_222_of56a_identifier_code").attr("disabled", true);
        $("#_224_of56d_party_identifier").attr("disabled", true);
        $("#_225_of56d_name_address").attr("disabled", true);
        $("#_226_of56j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //mf57_a_d_j
    $("#div_mf57_a_b2").hide();
    $("#div_mf57_d_b2").hide();
    $("#div_mf57_j_b2").hide();
    $("#_231_mf57a_party_identifier").attr("disabled", true);
    $("#_232_mf57a_identifier_code").attr("disabled", true);
    $("#_234_mf57d_party_identifier").attr("disabled", true);
    $("#_235_mf57d_name_address").attr("disabled", true);
    $("#_236_mf57j_party_identification").attr("disabled", true);
    $("#type_mf57_b2").change(function () {
      if ($("#type_mf57_b2").val() == "a") {
        $("#div_mf57_a_b2").show();
        $("#div_mf57_d_b2").hide();
        $("#div_mf57_j_b2").hide();
        $("#_231_mf57a_party_identifier").attr("disabled", false);
        $("#_232_mf57a_identifier_code").attr("disabled", false);
        $("#_234_mf57d_party_identifier").attr("disabled", true);
        $("#_235_mf57d_name_address").attr("disabled", true);
        $("#_236_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_b2").val() == "d") {
        $("#div_mf57_a_b2").hide();
        $("#div_mf57_d_b2").show();
        $("#div_mf57_j_b2").hide();
        $("#_231_mf57a_party_identifier").attr("disabled", true);
        $("#_232_mf57a_identifier_code").attr("disabled", true);
        $("#_234_mf57d_party_identifier").attr("disabled", false);
        $("#_235_mf57d_name_address").attr("disabled", false);
        $("#_236_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_b2").val() == "j") {
        $("#div_mf57_a_b2").hide();
        $("#div_mf57_d_b2").hide();
        $("#div_mf57_j_b2").show();
        $("#_231_mf57a_party_identifier").attr("disabled", true);
        $("#_232_mf57a_identifier_code").attr("disabled", true);
        $("#_234_mf57d_party_identifier").attr("disabled", true);
        $("#_235_mf57d_name_address").attr("disabled", true);
        $("#_236_mf57j_party_identification").attr("disabled", false);
      } else {
        $("#div_mf57_a_b2").hide();
        $("#div_mf57_d_b2").hide();
        $("#div_mf57_j_b2").hide();
        $("#_231_mf57a_party_identifier").attr("disabled", true);
        $("#_232_mf57a_identifier_code").attr("disabled", true);
        $("#_234_mf57d_party_identifier").attr("disabled", true);
        $("#_235_mf57d_name_address").attr("disabled", true);
        $("#_236_mf57j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of58_a_d_j
    $("#div_of58_a").hide();
    $("#div_of58_d").hide();
    $("#div_of58_j").hide();
    $("#_241_of58a_party_identifier").attr("disabled", true);
    $("#_242_of58a_identifier_code").attr("disabled", true);
    $("#_244_of58d_party_identifier").attr("disabled", true);
    $("#_245_of58d_name_address").attr("disabled", true);
    $("#_246_of58j_party_identification").attr("disabled", true);
    $("#type_of58_").change(function () {
      if ($("#type_of58_").val() == "a") {
        $("#div_of58_a").show();
        $("#div_of58_d").hide();
        $("#div_of58_j").hide();
        $("#_241_of58a_party_identifier").attr("disabled", false);
        $("#_242_of58a_identifier_code").attr("disabled", false);
        $("#_244_of58d_party_identifier").attr("disabled", true);
        $("#_245_of58d_name_address").attr("disabled", true);
        $("#_246_of58j_party_identification").attr("disabled", true);
      } else if ($("#type_of58_").val() == "d") {
        $("#div_of58_a").hide();
        $("#div_of58_d").show();
        $("#div_of58_j").hide();
        $("#_241_of58a_party_identifier").attr("disabled", true);
        $("#_242_of58a_identifier_code").attr("disabled", true);
        $("#_244_of58d_party_identifier").attr("disabled", false);
        $("#_245_of58d_name_address").attr("disabled", false);
        $("#_246_of58j_party_identification").attr("disabled", true);
      } else if ($("#type_of58_").val() == "j") {
        $("#div_of58_a").hide();
        $("#div_of58_d").hide();
        $("#div_of58_j").show();
        $("#_241_of58a_party_identifier").attr("disabled", true);
        $("#_242_of58a_identifier_code").attr("disabled", true);
        $("#_244_of58d_party_identifier").attr("disabled", true);
        $("#_245_of58d_name_address").attr("disabled", true);
        $("#_246_of58j_party_identification").attr("disabled", false);
      } else {
        $("#div_of58_a").hide();
        $("#div_of58_d").hide();
        $("#div_of58_j").hide();
        $("#_241_of58a_party_identifier").attr("disabled", true);
        $("#_242_of58a_identifier_code").attr("disabled", true);
        $("#_244_of58d_party_identifier").attr("disabled", true);
        $("#_245_of58d_name_address").attr("disabled", true);
        $("#_246_of58j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //Optional Sequence C Optional General Information
    //of84_a_b_d_j
    $("#div_of84_a").hide();
    $("#div_of84_b").hide();
    $("#div_of84_d").hide();
    $("#div_of84_j").hide();
    $("#_271_of84a_party_identifier").attr("disabled", true);
    $("#_272_of84a_identifier_code").attr("disabled", true);
    $("#_274_of84b_party_identifier").attr("disabled", true);
    $("#_275_of84b_location").attr("disabled", true);
    $("#_276_of84d_party_identifier").attr("disabled", true);
    $("#_277_of84d_name_and_address").attr("disabled", true);
    $("#_278_of84j_party_identification").attr("disabled", true);
    $("#type_of84_").change(function () {
      if ($("#type_of84_").val() == "a") {
        $("#div_of84_a").show();
        $("#div_of84_b").hide();
        $("#div_of84_d").hide();
        $("#div_of84_j").hide();
        $("#_271_of84a_party_identifier").attr("disabled", false);
        $("#_272_of84a_identifier_code").attr("disabled", false);
        $("#_274_of84b_party_identifier").attr("disabled", true);
        $("#_275_of84b_location").attr("disabled", true);
        $("#_276_of84d_party_identifier").attr("disabled", true);
        $("#_277_of84d_name_and_address").attr("disabled", true);
        $("#_278_of84j_party_identification").attr("disabled", true);
      } else if ($("#type_of84_").val() == "b") {
        $("#div_of84_a").hide();
        $("#div_of84_b").show();
        $("#div_of84_d").hide();
        $("#div_of84_j").hide();
        $("#_271_of84a_party_identifier").attr("disabled", true);
        $("#_272_of84a_identifier_code").attr("disabled", true);
        $("#_274_of84b_party_identifier").attr("disabled", false);
        $("#_275_of84b_location").attr("disabled", false);
        $("#_276_of84d_party_identifier").attr("disabled", true);
        $("#_277_of84d_name_and_address").attr("disabled", true);
        $("#_278_of84j_party_identification").attr("disabled", true);
      } else if ($("#type_of84_").val() == "d") {
        $("#div_of84_a").hide();
        $("#div_of84_b").hide();
        $("#div_of84_d").show();
        $("#div_of84_j").hide();
        $("#_271_of84a_party_identifier").attr("disabled", true);
        $("#_272_of84a_identifier_code").attr("disabled", true);
        $("#_274_of84b_party_identifier").attr("disabled", true);
        $("#_275_of84b_location").attr("disabled", true);
        $("#_276_of84d_party_identifier").attr("disabled", false);
        $("#_277_of84d_name_and_address").attr("disabled", false);
        $("#_278_of84j_party_identification").attr("disabled", true);
      } else if ($("#type_of84_").val() == "j") {
        $("#div_of84_a").hide();
        $("#div_of84_b").hide();
        $("#div_of84_d").hide();
        $("#div_of84_j").show();
        $("#_271_of84a_party_identifier").attr("disabled", true);
        $("#_272_of84a_identifier_code").attr("disabled", true);
        $("#_274_of84b_party_identifier").attr("disabled", true);
        $("#_275_of84b_location").attr("disabled", true);
        $("#_276_of84d_party_identifier").attr("disabled", true);
        $("#_277_of84d_name_and_address").attr("disabled", true);
        $("#_278_of84j_party_identification").attr("disabled", false);
      } else {
        $("#div_of84_a").hide();
        $("#div_of84_b").hide();
        $("#div_of84_d").hide();
        $("#div_of84_j").hide();
        $("#_271_of84a_party_identifier").attr("disabled", true);
        $("#_272_of84a_identifier_code").attr("disabled", true);
        $("#_274_of84b_party_identifier").attr("disabled", true);
        $("#_275_of84b_location").attr("disabled", true);
        $("#_276_of84d_party_identifier").attr("disabled", true);
        $("#_277_of84d_name_and_address").attr("disabled", true);
        $("#_278_of84j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of85_a_b_d_j
    $("#div_of85_a").hide();
    $("#div_of85_b").hide();
    $("#div_of85_d").hide();
    $("#div_of85_j").hide();
    $("#_281_of85a_party_identifier").attr("disabled", true);
    $("#_282_of85a_identifier_code").attr("disabled", true);
    $("#_284_of85b_party_identifier").attr("disabled", true);
    $("#_285_of85b_location").attr("disabled", true);
    $("#_286_of85d_party_identifier").attr("disabled", true);
    $("#_287_of85d_name_and_address").attr("disabled", true);
    $("#_288_of85j_party_identification").attr("disabled", true);
    $("#type_of85_").change(function () {
      if ($("#type_of85_").val() == "a") {
        $("#div_of85_a").show();
        $("#div_of85_b").hide();
        $("#div_of85_d").hide();
        $("#div_of85_j").hide();
        $("#_281_of85a_party_identifier").attr("disabled", false);
        $("#_282_of85a_identifier_code").attr("disabled", false);
        $("#_284_of85b_party_identifier").attr("disabled", true);
        $("#_285_of85b_location").attr("disabled", true);
        $("#_286_of85d_party_identifier").attr("disabled", true);
        $("#_287_of85d_name_and_address").attr("disabled", true);
        $("#_288_of85j_party_identification").attr("disabled", true);
      } else if ($("#type_of85_").val() == "b") {
        $("#div_of85_a").hide();
        $("#div_of85_b").show();
        $("#div_of85_d").hide();
        $("#div_of85_j").hide();
        $("#_281_of85a_party_identifier").attr("disabled", true);
        $("#_282_of85a_identifier_code").attr("disabled", true);
        $("#_284_of85b_party_identifier").attr("disabled", false);
        $("#_285_of85b_location").attr("disabled", false);
        $("#_286_of85d_party_identifier").attr("disabled", true);
        $("#_287_of85d_name_and_address").attr("disabled", true);
        $("#_288_of85j_party_identification").attr("disabled", true);
      } else if ($("#type_of85_").val() == "d") {
        $("#div_of85_a").hide();
        $("#div_of85_b").hide();
        $("#div_of85_d").show();
        $("#div_of85_j").hide();
        $("#_281_of85a_party_identifier").attr("disabled", true);
        $("#_282_of85a_identifier_code").attr("disabled", true);
        $("#_284_of85b_party_identifier").attr("disabled", true);
        $("#_285_of85b_location").attr("disabled", true);
        $("#_286_of85d_party_identifier").attr("disabled", false);
        $("#_287_of85d_name_and_address").attr("disabled", false);
        $("#_288_of85j_party_identification").attr("disabled", true);
      } else if ($("#type_of85_").val() == "j") {
        $("#div_of85_a").hide();
        $("#div_of85_b").hide();
        $("#div_of85_d").hide();
        $("#div_of85_j").show();
        $("#_281_of85a_party_identifier").attr("disabled", true);
        $("#_282_of85a_identifier_code").attr("disabled", true);
        $("#_284_of85b_party_identifier").attr("disabled", true);
        $("#_285_of85b_location").attr("disabled", true);
        $("#_286_of85d_party_identifier").attr("disabled", true);
        $("#_287_of85d_name_and_address").attr("disabled", true);
        $("#_288_of85j_party_identification").attr("disabled", false);
      } else {
        $("#div_of85_a").hide();
        $("#div_of85_b").hide();
        $("#div_of85_d").hide();
        $("#div_of85_j").hide();
        $("#_281_of85a_party_identifier").attr("disabled", true);
        $("#_282_of85a_identifier_code").attr("disabled", true);
        $("#_284_of85b_party_identifier").attr("disabled", true);
        $("#_285_of85b_location").attr("disabled", true);
        $("#_286_of85d_party_identifier").attr("disabled", true);
        $("#_287_of85d_name_and_address").attr("disabled", true);
        $("#_288_of85j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of88_a_d_j
    $("#div_of88_a").hide();
    $("#div_of88_d").hide();
    $("#div_of88_j").hide();
    $("#_291_of88a_party_identifier").attr("disabled", true);
    $("#_292_of88a_identifier_code").attr("disabled", true);
    $("#_294_of88d_party_identifier").attr("disabled", true);
    $("#_295_of88d_name_and_address").attr("disabled", true);
    $("#_296_of88j_party_identification").attr("disabled", true);
    $("#type_of88_").change(function () {
      if ($("#type_of88_").val() == "a") {
        $("#div_of88_a").show();
        $("#div_of88_d").hide();
        $("#div_of88_j").hide();
        $("#_291_of88a_party_identifier").attr("disabled", false);
        $("#_292_of88a_identifier_code").attr("disabled", false);
        $("#_294_of88d_party_identifier").attr("disabled", true);
        $("#_295_of88d_name_and_address").attr("disabled", true);
        $("#_296_of88j_party_identification").attr("disabled", true);
      } else if ($("#type_of88_").val() == "d") {
        $("#div_of88_a").hide();
        $("#div_of88_d").show();
        $("#div_of88_j").hide();
        $("#_291_of88a_party_identifier").attr("disabled", true);
        $("#_292_of88a_identifier_code").attr("disabled", true);
        $("#_294_of88d_party_identifier").attr("disabled", false);
        $("#_295_of88d_name_and_address").attr("disabled", false);
        $("#_296_of88j_party_identification").attr("disabled", true);
      } else if ($("#type_of88_").val() == "j") {
        $("#div_of88_a").hide();
        $("#div_of88_d").hide();
        $("#div_of88_j").show();
        $("#_291_of88a_party_identifier").attr("disabled", true);
        $("#_292_of88a_identifier_code").attr("disabled", true);
        $("#_294_of88d_party_identifier").attr("disabled", true);
        $("#_295_of88d_name_and_address").attr("disabled", true);
        $("#_296_of88j_party_identification").attr("disabled", false);
      } else {
        $("#div_of88_a").hide();
        $("#div_of88_d").hide();
        $("#div_of88_j").hide();
        $("#_291_of88a_party_identifier").attr("disabled", true);
        $("#_292_of88a_identifier_code").attr("disabled", true);
        $("#_294_of88d_party_identifier").attr("disabled", true);
        $("#_295_of88d_name_and_address").attr("disabled", true);
        $("#_296_of88j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //OF29A_check
    $("#check_of29a").hide();
    $("#_250_of29a_contact_information").attr("disabled", true);
    $("#contact_information_checkbox").click(function () {
      if ($("#contact_information_checkbox").is(":checked")) {
        $("#check_of29a").show();
        $("#_250_of29a_contact_information").attr("disabled", false);
      } else {
        $("#check_of29a").hide();
        $("#_250_of29a_contact_information").attr("disabled", true);
      }
    });
    //end of the line
    //OF24D_check
    $("#check_of24d").hide();
    $("#_260_of24d_dealing_method").attr("disabled", true);
    $("#_261_of24d_additional_information").attr("disabled", true);
    $("#dealing_method_checkbox").click(function () {
      if ($("#dealing_method_checkbox").is(":checked")) {
        $("#check_of24d").show();
        $("#_260_of24d_dealing_method").attr("disabled", false);
        $("#_261_of24d_additional_information").attr("disabled", false);
      } else {
        $("#check_of24d").hide();
        $("#_260_of24d_dealing_method").attr("disabled", true);
        $("#_261_of24d_additional_information").attr("disabled", true);
      }
    });
    //end of the line
    //check_of71f
    $("#check_of71f").hide();
    $("#_300_of71f_currency").attr("disabled", true);
    $("#_301_of71f_amount").attr("disabled", true);
    $("#broker_commission_checkbox").click(function () {
      if ($("#broker_commission_checkbox").is(":checked")) {
        $("#check_of71f").show();
        $("#_300_of71f_currency").attr("disabled", false);
        $("#_301_of71f_amount").attr("disabled", false);
      } else {
        $("#check_of71f").hide();
        $("#_300_of71f_currency").attr("disabled", true);
        $("#_301_of71f_amount").attr("disabled", true);
      }
    });
    //end of the line
    //check_of26h
    $("#check_of26h").hide();
    $("#_310_of26h_counterpartys_reference").attr("disabled", true);
    $("#counterparty_reference_checkbox").click(function () {
      if ($("#counterparty_reference_checkbox").is(":checked")) {
        $("#check_of26h").show();
        $("#_310_of26h_counterpartys_reference").attr("disabled", false);
      } else {
        $("#check_of26h").hide();
        $("#_310_of26h_counterpartys_reference").attr("disabled", true);
      }
    });
    //end of the line
    //check_of21g
    $("#check_of21g").hide();
    $("#_320_of21g_brokers_reference").attr("disabled", true);
    $("#brokers_reference_checkbox").click(function () {
      if ($("#brokers_reference_checkbox").is(":checked")) {
        $("#check_of21g").show();
        $("#_320_of21g_brokers_reference").attr("disabled", false);
      } else {
        $("#check_of21g").hide();
        $("#_320_of21g_brokers_reference").attr("disabled", true);
      }
    });
    //end of the line
    //check_of72
    $("#check_of72").hide();
    $("#_330_of72_code").attr("disabled", true);
    $("#_331_of72_narrative").attr("disabled", true);
    $("#sender_to_receiver_information_checkbox").click(function () {
      if ($("#sender_to_receiver_information_checkbox").is(":checked")) {
        $("#check_of72").show();
        $("#_330_of72_code").attr("disabled", false);
        $("#_331_of72_narrative").attr("disabled", false);
      } else {
        $("#check_of72").hide();
        $("#_330_of72_code").attr("disabled", true);
        $("#_331_of72_narrative").attr("disabled", true);
      }
    });
    //end of the line
    //Optional Sequence D Split Settlement Details
    //of53_a_d_j
    $("#div_of53_a_d").hide();
    $("#div_of53_d_d").hide();
    $("#div_of53_j_d").hide();
    $("#_371_of53a_party_identifier").attr("disabled", true);
    $("#_372_of53a_identifier_code").attr("disabled", true);
    $("#_374_of53d_party_identifier").attr("disabled", true);
    $("#_375_of53d_name_address").attr("disabled", true);
    $("#_376_of53j_party_identification").attr("disabled", true);
    $("#type_of53_d").change(function () {
      if ($("#type_of53_d").val() == "a") {
        $("#div_of53_a_d").show();
        $("#div_of53_d_d").hide();
        $("#div_of53_j_d").hide();
        $("#_371_of53a_party_identifier").attr("disabled", false);
        $("#_372_of53a_identifier_code").attr("disabled", false);
        $("#_374_of53d_party_identifier").attr("disabled", true);
        $("#_375_of53d_name_address").attr("disabled", true);
        $("#_376_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_d").val() == "d") {
        $("#div_of53_a_d").hide();
        $("#div_of53_d_d").show();
        $("#div_of53_j_d").hide();
        $("#_371_of53a_party_identifier").attr("disabled", true);
        $("#_372_of53a_identifier_code").attr("disabled", true);
        $("#_374_of53d_party_identifier").attr("disabled", false);
        $("#_375_of53d_name_address").attr("disabled", false);
        $("#_376_of53j_party_identification").attr("disabled", true);
      } else if ($("#type_of53_d").val() == "j") {
        $("#div_of53_a_d").hide();
        $("#div_of53_d_d").hide();
        $("#div_of53_j_d").show();
        $("#_371_of53a_party_identifier").attr("disabled", true);
        $("#_372_of53a_identifier_code").attr("disabled", true);
        $("#_374_of53d_party_identifier").attr("disabled", true);
        $("#_375_of53d_name_address").attr("disabled", true);
        $("#_376_of53j_party_identification").attr("disabled", false);
      } else {
        $("#div_of53_a_d").hide();
        $("#div_of53_d_d").hide();
        $("#div_of53_j_d").hide();
        $("#_371_of53a_party_identifier").attr("disabled", true);
        $("#_372_of53a_identifier_code").attr("disabled", true);
        $("#_374_of53d_party_identifier").attr("disabled", true);
        $("#_375_of53d_name_address").attr("disabled", true);
        $("#_376_of53j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of56
    $("#div_of56_a_d").hide();
    $("#div_of56_d_d").hide();
    $("#div_of56_j_d").hide();
    $("#_381_of56a_party_identifier").attr("disabled", true);
    $("#_382_of56a_identifier_code").attr("disabled", true);
    $("#_384_of56d_party_identifier").attr("disabled", true);
    $("#_385_of56d_name_address").attr("disabled", true);
    $("#_386_of56j_party_identification").attr("disabled", true);
    $("#type_of56_d").change(function () {
      if ($("#type_of56_d").val() == "a") {
        $("#div_of56_a_d").show();
        $("#div_of56_d_d").hide();
        $("#div_of56_j_d").hide();
        $("#_381_of56a_party_identifier").attr("disabled", false);
        $("#_382_of56a_identifier_code").attr("disabled", false);
        $("#_384_of56d_party_identifier").attr("disabled", true);
        $("#_385_of56d_name_address").attr("disabled", true);
        $("#_386_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_d").val() == "d") {
        $("#div_of56_a_d").hide();
        $("#div_of56_d_d").show();
        $("#div_of56_j_d").hide();
        $("#_381_of56a_party_identifier").attr("disabled", true);
        $("#_382_of56a_identifier_code").attr("disabled", true);
        $("#_384_of56d_party_identifier").attr("disabled", false);
        $("#_385_of56d_name_address").attr("disabled", false);
        $("#_386_of56j_party_identification").attr("disabled", true);
      } else if ($("#type_of56_d").val() == "j") {
        $("#div_of56_a_d").hide();
        $("#div_of56_d_d").hide();
        $("#div_of56_j_d").show();
        $("#_381_of56a_party_identifier").attr("disabled", true);
        $("#_382_of56a_identifier_code").attr("disabled", true);
        $("#_384_of56d_party_identifier").attr("disabled", true);
        $("#_385_of56d_name_address").attr("disabled", true);
        $("#_386_of56j_party_identification").attr("disabled", false);
      } else {
        $("#div_of56_a_d").hide();
        $("#div_of56_d_d").hide();
        $("#div_of56_j_d").hide();
        $("#_381_of56a_party_identifier").attr("disabled", true);
        $("#_382_of56a_identifier_code").attr("disabled", true);
        $("#_384_of56d_party_identifier").attr("disabled", true);
        $("#_385_of56d_name_address").attr("disabled", true);
        $("#_386_of56j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //mf57
    $("#div_mf57_a_d").hide();
    $("#div_mf57_d_d").hide();
    $("#div_mf57_j_d").hide();
    $("#_391_mf57a_party_identifier").attr("disabled", true);
    $("#_392_mf57a_identifier_code").attr("disabled", true);
    $("#_394_mf57d_party_identifier").attr("disabled", true);
    $("#_395_mf57d_name_address").attr("disabled", true);
    $("#_396_mf57j_party_identification").attr("disabled", true);
    $("#type_mf57_d").change(function () {
      if ($("#type_mf57_d").val() == "a") {
        $("#div_mf57_a_d").show();
        $("#div_mf57_d_d").hide();
        $("#div_mf57_j_d").hide();
        $("#_391_mf57a_party_identifier").attr("disabled", false);
        $("#_392_mf57a_identifier_code").attr("disabled", false);
        $("#_394_mf57d_party_identifier").attr("disabled", true);
        $("#_395_mf57d_name_address").attr("disabled", true);
        $("#_396_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_d").val() == "d") {
        $("#div_mf57_a_d").hide();
        $("#div_mf57_d_d").show();
        $("#div_mf57_j_d").hide();
        $("#_391_mf57a_party_identifier").attr("disabled", true);
        $("#_392_mf57a_identifier_code").attr("disabled", true);
        $("#_394_mf57d_party_identifier").attr("disabled", false);
        $("#_395_mf57d_name_address").attr("disabled", false);
        $("#_396_mf57j_party_identification").attr("disabled", true);
      } else if ($("#type_mf57_d").val() == "j") {
        $("#div_mf57_a_d").hide();
        $("#div_mf57_d_d").hide();
        $("#div_mf57_j_d").show();
        $("#_391_mf57a_party_identifier").attr("disabled", true);
        $("#_392_mf57a_identifier_code").attr("disabled", true);
        $("#_394_mf57d_party_identifier").attr("disabled", true);
        $("#_395_mf57d_name_address").attr("disabled", true);
        $("#_396_mf57j_party_identification").attr("disabled", false);
      } else {
        $("#div_mf57_a_d").hide();
        $("#div_mf57_d_d").hide();
        $("#div_mf57_j_d").hide();
        $("#_391_mf57a_party_identifier").attr("disabled", true);
        $("#_392_mf57a_identifier_code").attr("disabled", true);
        $("#_394_mf57d_party_identifier").attr("disabled", true);
        $("#_395_mf57d_name_address").attr("disabled", true);
        $("#_396_mf57j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //of58
    $("#div_of58_a_d").hide();
    $("#div_of58_d_d").hide();
    $("#div_of58_j_d").hide();
    $("#_401_of58a_party_identifier").attr("disabled", true);
    $("#_402_of58a_identifier_code").attr("disabled", true);
    $("#_404_of58d_party_identifier").attr("disabled", true);
    $("#_405_of58d_name_address").attr("disabled", true);
    $("#_406_of58j_party_identification").attr("disabled", true);
    $("#type_of58_d").change(function () {
      if ($("#type_of58_d").val() == "a") {
        $("#div_of58_a_d").show();
        $("#div_of58_d_d").hide();
        $("#div_of58_j_d").hide();
        $("#_401_of58a_party_identifier").attr("disabled", false);
        $("#_402_of58a_identifier_code").attr("disabled", false);
        $("#_404_of58d_party_identifier").attr("disabled", true);
        $("#_405_of58d_name_address").attr("disabled", true);
        $("#_406_of58j_party_identification").attr("disabled", true);
      } else if ($("#type_of58_d").val() == "d") {
        $("#div_of58_a_d").hide();
        $("#div_of58_d_d").show();
        $("#div_of58_j_d").hide();
        $("#_401_of58a_party_identifier").attr("disabled", true);
        $("#_402_of58a_identifier_code").attr("disabled", true);
        $("#_404_of58d_party_identifier").attr("disabled", false);
        $("#_405_of58d_name_address").attr("disabled", false);
        $("#_406_of58j_party_identification").attr("disabled", true);
      } else if ($("#type_of58_d").val() == "j") {
        $("#div_of58_a_d").hide();
        $("#div_of58_d_d").hide();
        $("#div_of58_j_d").show();
        $("#_401_of58a_party_identifier").attr("disabled", true);
        $("#_402_of58a_identifier_code").attr("disabled", true);
        $("#_404_of58d_party_identifier").attr("disabled", true);
        $("#_405_of58d_name_address").attr("disabled", true);
        $("#_406_of58j_party_identification").attr("disabled", false);
      } else {
        $("#div_of58_a_d").hide();
        $("#div_of58_d_d").hide();
        $("#div_of58_j_d").hide();
        $("#_401_of58a_party_identifier").attr("disabled", true);
        $("#_402_of58a_identifier_code").attr("disabled", true);
        $("#_404_of58d_party_identifier").attr("disabled", true);
        $("#_405_of58d_name_address").attr("disabled", true);
        $("#_406_of58j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //additional
    //Seq C checkbox
    $("#check_seq_c").hide();
    $("#_260_of24d_dealing_method").attr("disabled", true);
    $("#_330_of72_code").attr("disabled", true);
    $("#_272_of84a_identifier_code").attr("disabled", true);
    $("#_277_of84d_name_and_address").attr("disabled", true);
    $("#_278_of84j_party_identification").attr("disabled", true);
    $("#_282_of85a_identifier_code").attr("disabled", true);
    $("#_287_of85d_name_and_address").attr("disabled", true);
    $("#_288_of85j_party_identification").attr("disabled", true);
    $("#_292_of88a_identifier_code").attr("disabled", true);
    $("#_295_of88d_name_and_address").attr("disabled", true);
    $("#_296_of88j_party_identification").attr("disabled", true);
    $("#seq_C_checkbox").click(function () {
      if ($("#seq_C_checkbox").is(":checked")) {
        $("#check_seq_c").show();
        $("#_260_of24d_dealing_method").attr("disabled", false);
        $("#_330_of72_code").attr("disabled", false);
        $("#_272_of84a_identifier_code").attr("disabled", false);
        $("#_277_of84d_name_and_address").attr("disabled", false);
        $("#_278_of84j_party_identification").attr("disabled", false);
        $("#_282_of85a_identifier_code").attr("disabled", false);
        $("#_287_of85d_name_and_address").attr("disabled", false);
        $("#_288_of85j_party_identification").attr("disabled", false);
        $("#_292_of88a_identifier_code").attr("disabled", false);
        $("#_295_of88d_name_and_address").attr("disabled", false);
        $("#_296_of88j_party_identification").attr("disabled", false);
      } else {
        $("#check_seq_c").hide();
        $("#_260_of24d_dealing_method").attr("disabled", true);
        $("#_330_of72_code").attr("disabled", true);
        $("#_272_of84a_identifier_code").attr("disabled", true);
        $("#_277_of84d_name_and_address").attr("disabled", true);
        $("#_278_of84j_party_identification").attr("disabled", true);
        $("#_282_of85a_identifier_code").attr("disabled", true);
        $("#_287_of85d_name_and_address").attr("disabled", true);
        $("#_288_of85j_party_identification").attr("disabled", true);
        $("#_292_of88a_identifier_code").attr("disabled", true);
        $("#_295_of88d_name_and_address").attr("disabled", true);
        $("#_296_of88j_party_identification").attr("disabled", true);
      }
    });
    //end of the line
    //Seq D checkbox
    $("#check_seq_d").hide();
    $("#_410_mf16a_number_of_settlements").attr("disabled", true);
    $("#seq_D_checkbox").click(function () {
      if ($("#seq_D_checkbox").is(":checked")) {
        $("#check_seq_d").show();
        $("#_410_mf16a_number_of_settlements").attr("disabled", false);
      } else {
        $("#check_seq_d").hide();
        $("#_410_mf16a_number_of_settlements").attr("disabled", true);
      }
    });
    //end of the line
    //Check_of14s
    $("#check_of14s").hide();
    $("#check_ofcc1").attr("disabled", true);
    $("#check_ofcc2").attr("disabled", true);
    $("#settlement_rate_source_checkbox").click(function () {
      if ($("#settlement_rate_source_checkbox").is(":checked")) {
        $("#check_of14s").show();
        $("#check_ofcc1").attr("disabled", false);
        $("#check_ofcc2").attr("disabled", false);
      } else {
        $("#check_of14s").hide();
        $("#check_ofcc1").attr("disabled", true);
        $("#check_ofcc2").attr("disabled", true);
      }
    });
    //end of the line
    //check_of14s_occ_1
    $("#check_ofcc1").hide();
    $("#_106_of14s_rate_source").attr("disabled", true);
    $("#occ_1_chexbox").click(function () {
      if ($("#occ_1_chexbox").is(":checked")) {
        $("#check_ofcc1").show();
        $("#_106_of14s_rate_source").attr("disabled", false);
      } else {
        $("#check_ofcc1").hide();
        $("#_106_of14s_rate_source").attr("disabled", true);
      }
    });
    //end of the line
    //check_of14s_occ_1_check_oftl_I
    $("#check_oftl_I").hide();
    $("#_107_of14s_time").attr("disabled", true);
    $("#_108_of14s_location").attr("disabled", true);
    $("#time_and_location_I_checkbox").click(function () {
      if ($("#time_and_location_I_checkbox").is(":checked")) {
        $("#check_oftl_I").show();
        $("#_107_of14s_time").attr("disabled", false);
        $("#_108_of14s_location").attr("disabled", false);
      } else {
        $("#check_oftl_I").hide();
        $("#_107_of14s_time").attr("disabled", true);
        $("#_108_of14s_location").attr("disabled", true);
      }
    });
    //end of the line
    //check_of14s_occ_2
    $("#check_ofcc2").hide();
    $("#_109_of14s_rate_resource").attr("disabled", true);
    $("#occ_2_checkbox").click(function () {
      if ($("#occ_2_checkbox").is(":checked")) {
        $("#check_ofcc2").show();
        $("#_109_of14s_rate_resource").attr("disabled", false);
      } else {
        $("#check_ofcc2").hide();
        $("#_109_of14s_rate_resource").attr("disabled", true);
      }
    });
    //end of the line
    //check_of14s_occ_1_check_oftl_II
    $("#check_oftl_II").hide();
    $("#_110_of14s_time").attr("disabled", true);
    $("#_111_of14s_location").attr("disabled", true);
    $("#time_and_location_II_checkbox").click(function () {
      if ($("#time_and_location_II_checkbox").is(":checked")) {
        $("#check_oftl_II").show();
        $("#_110_of14s_time").attr("disabled", false);
        $("#_111_of14s_location").attr("disabled", false);
      } else {
        $("#check_oftl_II").hide();
        $("#_110_of14s_time").attr("disabled", true);
        $("#_111_of14s_location").attr("disabled", true);
      }
    });
    //end of the line
    //check_of_21
    $("#check_of21").hide();
    $("#_020_of21_related_reference").attr("disabled", true);
    $("#related_reference_checkbox").click(function () {
      if ($("#related_reference_checkbox").is(":checked")) {
        $("#check_of21").show();
        $("#_020_of21_related_reference").attr("disabled", false);
      } else {
        $("#check_of21").hide();
        $("#_020_of21_related_reference").attr("disabled", true);
      }
    });
    //end of the line
    //check_of_94a
    $("#check_of94a").hide();
    $("#_040_of94a_scope_of_operation").attr("disabled", true);
    $("#scope_of_operation_checkbox").click(function () {
      if ($("#scope_of_operation_checkbox").is(":checked")) {
        $("#check_of94a").show();
        $("#_040_of94a_scope_of_operation").attr("disabled", false);
      } else {
        $("#check_of94a").hide();
        $("#_040_of94a_scope_of_operation").attr("disabled", true);
      }
    });
    //end of the line
    //check_of17t
    $("#check_of17t").hide();
    $("#_050_of17t_block_trade_indicator").attr("disabled", true);
    $("#block_trade_indicator_checkbox").click(function () {
      if ($("#block_trade_indicator_checkbox").is(":checked")) {
        $("#check_of17t").show();
        $("#_050_of17t_block_trade_indicator").attr("disabled", false);
      } else {
        $("#check_of17t").hide();
        $("#_050_of17t_block_trade_indicator").attr("disabled", true);
      }
    });
    //end of the line
    //check_of17u
    $("#check_of17u").hide();
    $("#_060_of17u_split_settlement_indicator").attr("disabled", true);
    $("#split_settlement_indicator_checkbox").click(function () {
      if ($("#split_settlement_indicator_checkbox").is(":checked")) {
        $("#check_of17u").show();
        $("#_060_of17u_split_settlement_indicator").attr("disabled", false);
      } else {
        $("#check_of17u").hide();
        $("#_060_of17u_split_settlement_indicator").attr("disabled", true);
      }
    });
    //end of the line
    //check_of17i
    $("#check_of17i").hide();
    $("#_065_of17i_payment_versus_payment_settlement_indicator").attr(
      "disabled",
      true
    );
    $("#payment_versus_payment_settlement_indicator_checkbox").click(
      function () {
        if (
          $("#payment_versus_payment_settlement_indicator_checkbox").is(
            ":checked"
          )
        ) {
          $("#check_of17i").show();
          $("#_065_of17i_payment_versus_payment_settlement_indicator").attr(
            "disabled",
            false
          );
        } else {
          $("#check_of17i").hide();
          $("#_065_of17i_payment_versus_payment_settlement_indicator").attr(
            "disabled",
            true
          );
        }
      }
    );
    //end of the line
    //check_of83
    $("#check_of83").hide();
    $("#type_of83_").attr("disabled", true);
    $("#fund_or_instructing_party_checkbox").click(function () {
      if ($("#fund_or_instructing_party_checkbox").is(":checked")) {
        $("#check_of83").show();
        $("#type_of83_").attr("disabled", false);
      } else {
        $("#check_of83").hide();
        $("#type_of83_").attr("disabled", true);
      }
    });
    //end of the line
    //check_of77d
    $("#check_of77d").hide();
    $("#_100_of77d_terms_and_conditions").attr("disabled", true);
    $("#terms_and_conditions_checkbox").click(function () {
      if ($("#terms_and_conditions_checkbox").is(":checked")) {
        $("#check_of77d").show();
        $("#_100_of77d_terms_and_conditions").attr("disabled", false);
      } else {
        $("#check_of77d").hide();
        $("#_100_of77d_terms_and_conditions").attr("disabled", true);
      }
    });
    //end of the line
    //check_of14c
    $("#check_of14c").hide();
    $("#_101_of14c_year_of_definitions").attr("disabled", true);
    $("#year_of_definitions_checkbox").click(function () {
      if ($("#year_of_definitions_checkbox").is(":checked")) {
        $("#check_of14c").show();
        $("#_101_of14c_year_of_definitions").attr("disabled", false);
      } else {
        $("#check_of14c").hide();
        $("#_101_of14c_year_of_definitions").attr("disabled", true);
      }
    });
    //end of the line
    //check_of17f
    $("#check_of17f").hide();
    $("#_102_of17f_non_deliverable_indicator").attr("disabled", true);
    $("#deliverable_indicator_checkbox").click(function () {
      if ($("#deliverable_indicator_checkbox").is(":checked")) {
        $("#check_of17f").show();
        $("#_102_of17f_non_deliverable_indicator").attr("disabled", false);
      } else {
        $("#check_of17f").hide();
        $("#_102_of17f_non_deliverable_indicator").attr("disabled", true);
      }
    });
    //end of the line
    //check_of17o
    $("#check_of17o").hide();
    $("#_103_of17o_ndf_open_indicator").attr("disabled", true);
    $("#NDF_open_indicator_checkbox").click(function () {
      if ($("#NDF_open_indicator_checkbox").is(":checked")) {
        $("#check_of17o").show();
        $("#_103_of17o_ndf_open_indicator").attr("disabled", false);
      } else {
        $("#check_of17o").hide();
        $("#_103_of17o_ndf_open_indicator").attr("disabled", true);
      }
    });
    //end of the line
    //check_of32e
    $("#check_of32e").hide();
    $("#_104_of32e_currency").attr("disabled", true);
    $("#settlement_currency_checkbox").click(function () {
      if ($("#settlement_currency_checkbox").is(":checked")) {
        $("#check_of32e").show();
        $("#_104_of32e_currency").attr("disabled", false);
      } else {
        $("#check_of32e").hide();
        $("#_104_of32e_currency").attr("disabled", true);
      }
    });
    //end of the line
    //check_of30u
    $("#check_of30u").hide();
    $("#value_date_6").attr("disabled", true);
    $("#valuation_date_checkbox").click(function () {
      if ($("#valuation_date_checkbox").is(":checked")) {
        $("#check_of30u").show();
        $("#value_date_6").attr("disabled", false);
      } else {
        $("#check_of30u").hide();
        $("#value_date_6").attr("disabled", true);
      }
    });
    //end of the line
    //check_of84
    $("#check_of84").hide();
    $("#type_of84_").attr("disabled", true);
    $("#dealing_branch_party_A_checkbox").click(function () {
      if ($("#dealing_branch_party_A_checkbox").is(":checked")) {
        $("#check_of84").show();
        $("#type_of84_").attr("disabled", false);
      } else {
        $("#check_of84").hide();
        $("#type_of84_").attr("disabled", true);
      }
    });
    //end of the line
    //check_of85
    $("#check_of85").hide();
    $("#type_of85_").attr("disabled", true);
    $("#dealing_branch_party_B_checkbox").click(function () {
      if ($("#dealing_branch_party_B_checkbox").is(":checked")) {
        $("#check_of85").show();
        $("#type_of85_").attr("disabled", false);
      } else {
        $("#check_of85").hide();
        $("#type_of85_").attr("disabled", true);
      }
    });
    //end of the line
    //check_of88
    $("#check_of88").hide();
    $("#type_of88_").attr("disabled", true);
    $("#broker_identification_checkbox").click(function () {
      if ($("#broker_identification_checkbox").is(":checked")) {
        $("#check_of88").show();
        $("#type_of88_").attr("disabled", false);
      } else {
        $("#check_of88").hide();
        $("#type_of88_").attr("disabled", true);
      }
    });
    //end of the line
  });
</script>

<!-- rule view -->
<script language="javascript">
  $(document).ready(function () {
    //mf82_a_d_j
    if (
      $("#_071_mf82a_party_identifier").val() != "" ||
      $("#_072_mf82a_identifier_code").val() != ""
    ) {
      $("#type_mf82_").val("a").attr("selected", true);
      $("#div_mf82_a").show();
      $("#div_mf82_d").hide();
      $("#div_mf82_j").hide();
      $("#_071_mf82a_party_identifier").attr("disabled", false);
      $("#_072_mf82a_identifier_code").attr("disabled", false);
      $("#_074_mf82d_party_identifier").attr("disabled", true);
      $("#_075_mf82d_name_address").attr("disabled", true);
      $("#_076_mf82j_party_identification").attr("disabled", true);
    } else if (
      $("#_074_mf82d_party_identifier").val() != "" ||
      $("#_075_mf82d_name_address").val() != ""
    ) {
      $("#type_mf82_").val("d").attr("selected", true);
      $("#div_mf82_a").hide();
      $("#div_mf82_d").show();
      $("#div_mf82_j").hide();
      $("#_071_mf82a_party_identifier").attr("disabled", true);
      $("#_072_mf82a_identifier_code").attr("disabled", true);
      $("#_074_mf82d_party_identifier").attr("disabled", false);
      $("#_075_mf82d_name_address").attr("disabled", false);
      $("#_076_mf82j_party_identification").attr("disabled", true);
    } else if ($("#_076_mf82j_party_identification").val() != "") {
      $("#type_mf82_").val("j").attr("selected", true);
      $("#div_mf82_a").hide();
      $("#div_mf82_d").hide();
      $("#div_mf82_j").show();
      $("#_071_mf82a_party_identifier").attr("disabled", true);
      $("#_072_mf82a_identifier_code").attr("disabled", true);
      $("#_074_mf82d_party_identifier").attr("disabled", true);
      $("#_075_mf82d_name_address").attr("disabled", true);
      $("#_076_mf82j_party_identification").attr("disabled", false);
    } else {
      $("#div_mf82_a").hide();
      $("#div_mf82_d").hide();
      $("#div_mf82_j").hide();
      $("#_071_mf82a_party_identifier").attr("disabled", true);
      $("#_072_mf82a_identifier_code").attr("disabled", true);
      $("#_074_mf82d_party_identifier").attr("disabled", true);
      $("#_075_mf82d_name_address").attr("disabled", true);
      $("#_076_mf82j_party_identification").attr("disabled", true);
    }
    //end of the line
    //mf87_a_d_j
    if (
      $("#_081_mf87a_party_identifier").val() != "" ||
      $("#_082_mf87a_identifier_code").val() != ""
    ) {
      $("#type_mf87_").val("a").attr("selected", true);
      $("#div_mf87_a").show();
      $("#div_mf87_d").hide();
      $("#div_mf87_j").hide();
      $("#_081_mf87a_party_identifier").attr("disabled", false);
      $("#_082_mf87a_identifier_code").attr("disabled", false);
      $("#_084_mf87d_party_identifier").attr("disabled", true);
      $("#_085_mf87d_name_address").attr("disabled", true);
      $("#_086_mf87j_party_identification").attr("disabled", true);
    } else if (
      $("#_084_mf87d_party_identifier").val() != "" ||
      $("#_085_mf87d_name_address").val() != ""
    ) {
      $("#type_mf87_").val("d").attr("selected", true);
      $("#div_mf87_a").hide();
      $("#div_mf87_d").show();
      $("#div_mf87_j").hide();
      $("#_081_mf87a_party_identifier").attr("disabled", true);
      $("#_082_mf87a_identifier_code").attr("disabled", true);
      $("#_084_mf87d_party_identifier").attr("disabled", false);
      $("#_085_mf87d_name_address").attr("disabled", false);
      $("#_086_mf87j_party_identification").attr("disabled", true);
    } else if ($("#_086_mf87j_party_identification").val() != "") {
      $("#type_mf87_").val("j").attr("selected", true);
      $("#div_mf87_a").hide();
      $("#div_mf87_d").hide();
      $("#div_mf87_j").show();
      $("#_081_mf87a_party_identifier").attr("disabled", true);
      $("#_082_mf87a_identifier_code").attr("disabled", true);
      $("#_084_mf87d_party_identifier").attr("disabled", true);
      $("#_085_mf87d_name_address").attr("disabled", true);
      $("#_086_mf87j_party_identification").attr("disabled", false);
    } else {
      $("#div_mf87_a").hide();
      $("#div_mf87_d").hide();
      $("#div_mf87_j").hide();
      $("#_081_mf87a_party_identifier").attr("disabled", true);
      $("#_082_mf87a_identifier_code").attr("disabled", true);
      $("#_084_mf87d_party_identifier").attr("disabled", true);
      $("#_085_mf87d_name_address").attr("disabled", true);
      $("#_086_mf87j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of83_a_d_j
    if (
      $("#_091_of83a_party_identifier").val() != "" ||
      $("#_092_of83a_identifier_code").val() != ""
    ) {
      $("#type_of83_").val("a").attr("selected", true);
      $("#div_of83_a").show();
      $("#div_of83_d").hide();
      $("#div_of83_j").hide();
      $("#_091_of83a_party_identifier").attr("disabled", false);
      $("#_092_of83a_identifier_code").attr("disabled", false);
      $("#_094_of83d_party_identifier").attr("disabled", true);
      $("#_095_of83d_name_address").attr("disabled", true);
      $("#_096_of83j_party_identification").attr("disabled", true);
    } else if (
      $("#_094_of83d_party_identifier").val() != "" ||
      $("#_095_of83d_name_address").val() != ""
    ) {
      $("#type_of83_").val("d").attr("selected", true);
      $("#div_of83_a").hide();
      $("#div_of83_d").show();
      $("#div_of83_j").hide();
      $("#_091_of83a_party_identifier").attr("disabled", true);
      $("#_092_of83a_identifier_code").attr("disabled", true);
      $("#_094_of83d_party_identifier").attr("disabled", false);
      $("#_095_of83d_name_address").attr("disabled", false);
      $("#_096_of83j_party_identification").attr("disabled", true);
    } else if ($("#_086_mf87j_party_identification").val() != "") {
      $("#type_of83_").val("j").attr("selected", true);
      $("#div_of83_a").hide();
      $("#div_of83_d").hide();
      $("#div_of83_j").show();
      $("#_091_of83a_party_identifier").attr("disabled", true);
      $("#_092_of83a_identifier_code").attr("disabled", true);
      $("#_094_of83d_party_identifier").attr("disabled", true);
      $("#_095_of83d_name_address").attr("disabled", true);
      $("#_096_of83j_party_identification").attr("disabled", false);
    } else {
      $("#div_of83_a").hide();
      $("#div_of83_d").hide();
      $("#div_of83_j").hide();
      $("#_091_of83a_party_identifier").attr("disabled", true);
      $("#_092_of83a_identifier_code").attr("disabled", true);
      $("#_094_of83d_party_identifier").attr("disabled", true);
      $("#_095_of83d_name_address").attr("disabled", true);
      $("#_096_of83j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of77h
    if (
      $("#_097_of77h_type_of_agreement").val() != "" ||
      $("#value_date_7").val() != "" ||
      $("#_099_of77h_version").val() != ""
    ) {
      $("#type_date_version_checkbox").attr("checked", true);
      $("#check_of77h").show();
      $("#_097_of77h_type_of_agreement").attr("disabled", false);
      $("#value_date_7").attr("disabled", false);
      $("#_099_of77h_version").attr("disabled", false);
    } else {
      $("#check_of77h").hide();
      $("#_097_of77h_type_of_agreement").attr("disabled", true);
      $("#value_date_7").attr("disabled", true);
      $("#_099_of77h_version").attr("disabled", true);
    }
    //end of the line
    //of53_a_d_j
    if (
      $("#_171_of53a_party_identifier").val() != "" ||
      $("#_172_of53a_identifier_code").val() != ""
    ) {
      $("#type_of53_").val("a").attr("selected", true);
      $("#div_of53_a").show();
      $("#div_of53_d").hide();
      $("#div_of53_j").hide();
      $("#_171_of53a_party_identifier").attr("disabled", false);
      $("#_172_of53a_identifier_code").attr("disabled", false);
      $("#_174_of53d_party_identifier").attr("disabled", true);
      $("#_175_of53d_name_address").attr("disabled", true);
      $("#_176_of53j_party_identification").attr("disabled", true);
    } else if (
      $("#_174_of53d_party_identifier").val() != "" ||
      $("#_175_of53d_name_address").val() != ""
    ) {
      $("#type_of53_").val("d").attr("selected", true);
      $("#div_of53_a").hide();
      $("#div_of53_d").show();
      $("#div_of53_j").hide();
      $("#_171_of53a_party_identifier").attr("disabled", true);
      $("#_172_of53a_identifier_code").attr("disabled", true);
      $("#_174_of53d_party_identifier").attr("disabled", false);
      $("#_175_of53d_name_address").attr("disabled", false);
      $("#_176_of53j_party_identification").attr("disabled", true);
    } else if ($("#_176_of53j_party_identification").val() != "") {
      $("#type_of53_").val("j").attr("selected", true);
      $("#div_of53_a").hide();
      $("#div_of53_d").hide();
      $("#div_of53_j").show();
      $("#_171_of53a_party_identifier").attr("disabled", true);
      $("#_172_of53a_identifier_code").attr("disabled", true);
      $("#_174_of53d_party_identifier").attr("disabled", true);
      $("#_175_of53d_name_address").attr("disabled", true);
      $("#_176_of53j_party_identification").attr("disabled", false);
    } else {
      $("#div_of53_a").hide();
      $("#div_of53_d").hide();
      $("#div_of53_j").hide();
      $("#_171_of53a_party_identifier").attr("disabled", true);
      $("#_172_of53a_identifier_code").attr("disabled", true);
      $("#_174_of53d_party_identifier").attr("disabled", true);
      $("#_175_of53d_name_address").attr("disabled", true);
      $("#_176_of53j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of56_a_d_j
    if (
      $("#_181_of56a_party_identifier").val() != "" ||
      $("#_182_of56a_identifier_code").val() != ""
    ) {
      $("#type_of56_").val("a").attr("selected", true);
      $("#div_of56_a").show();
      $("#div_of56_d").hide();
      $("#div_of56_j").hide();
      $("#_181_of56a_party_identifier").attr("disabled", false);
      $("#_182_of56a_identifier_code").attr("disabled", false);
      $("#_184_of56d_party_identifier").attr("disabled", true);
      $("#_185_of56d_name_address").attr("disabled", true);
      $("#_186_of56j_party_identification").attr("disabled", true);
    } else if (
      $("#_184_of56d_party_identifier").val() != "" ||
      $("#_185_of56d_name_address").val() != ""
    ) {
      $("#type_of56_").val("d").attr("selected", true);
      $("#div_of56_a").hide();
      $("#div_of56_d").show();
      $("#div_of56_j").hide();
      $("#_181_of56a_party_identifier").attr("disabled", true);
      $("#_182_of56a_identifier_code").attr("disabled", true);
      $("#_184_of56d_party_identifier").attr("disabled", false);
      $("#_185_of56d_name_address").attr("disabled", false);
      $("#_186_of56j_party_identification").attr("disabled", true);
    } else if ($("#_186_of56j_party_identification").val() != "") {
      $("#type_of56_").val("j").attr("selected", true);
      $("#div_of56_a").hide();
      $("#div_of56_d").hide();
      $("#div_of56_j").show();
      $("#_181_of56a_party_identifier").attr("disabled", true);
      $("#_182_of56a_identifier_code").attr("disabled", true);
      $("#_184_of56d_party_identifier").attr("disabled", true);
      $("#_185_of56d_name_address").attr("disabled", true);
      $("#_186_of56j_party_identification").attr("disabled", false);
    } else {
      $("#div_of56_a").hide();
      $("#div_of56_d").hide();
      $("#div_of56_j").hide();
      $("#_181_of56a_party_identifier").attr("disabled", true);
      $("#_182_of56a_identifier_code").attr("disabled", true);
      $("#_184_of56d_party_identifier").attr("disabled", true);
      $("#_185_of56d_name_address").attr("disabled", true);
      $("#_186_of56j_party_identification").attr("disabled", true);
    }
    //end of the line
    //mf57_a_d_j
    if (
      $("#_191_mf57a_party_identifier").val() != "" ||
      $("#_192_mf57a_identifier_code").val() != ""
    ) {
      $("#type_mf57_").val("a").attr("selected", true);
      $("#div_mf57_a").show();
      $("#div_mf57_d").hide();
      $("#div_mf57_j").hide();
      $("#_191_mf57a_party_identifier").attr("disabled", false);
      $("#_192_mf57a_identifier_code").attr("disabled", false);
      $("#_194_mf57d_party_identifier").attr("disabled", true);
      $("#_195_mf57d_name_address").attr("disabled", true);
      $("#_196_mf57j_party_identification").attr("disabled", true);
    } else if (
      $("#_194_mf57d_party_identifier").val() != "" ||
      $("#_195_mf57d_name_address").val() != ""
    ) {
      $("#type_mf57_").val("d").attr("selected", true);
      $("#div_mf57_a").hide();
      $("#div_mf57_d").show();
      $("#div_mf57_j").hide();
      $("#_191_mf57a_party_identifier").attr("disabled", true);
      $("#_192_mf57a_identifier_code").attr("disabled", true);
      $("#_194_mf57d_party_identifier").attr("disabled", false);
      $("#_195_mf57d_name_address").attr("disabled", false);
      $("#_196_mf57j_party_identification").attr("disabled", true);
    } else if ($("#_196_mf57j_party_identification").val() != "") {
      $("#type_mf57_").val("j").attr("selected", true);
      $("#div_mf57_a").hide();
      $("#div_mf57_d").hide();
      $("#div_mf57_j").show();
      $("#_191_mf57a_party_identifier").attr("disabled", true);
      $("#_192_mf57a_identifier_code").attr("disabled", true);
      $("#_194_mf57d_party_identifier").attr("disabled", true);
      $("#_195_mf57d_name_address").attr("disabled", true);
      $("#_196_mf57j_party_identification").attr("disabled", false);
    } else {
      $("#div_mf57_a").hide();
      $("#div_mf57_d").hide();
      $("#div_mf57_j").hide();
      $("#_191_mf57a_party_identifier").attr("disabled", true);
      $("#_192_mf57a_identifier_code").attr("disabled", true);
      $("#_194_mf57d_party_identifier").attr("disabled", true);
      $("#_195_mf57d_name_address").attr("disabled", true);
      $("#_196_mf57j_party_identification").attr("disabled", true);
    }
    //end of the line
    //Mandatory Subsequence B2 Amount Sold
    //of53_a_d_j
    if (
      $("#_211_of53a_party_identifier").val() != "" ||
      $("#_212_of53a_identifier_code").val() != ""
    ) {
      $("#type_of53_b2").val("a").attr("selected", true);
      $("#div_of53_a_b2").show();
      $("#div_of53_d_b2").hide();
      $("#div_of53_j_b2").hide();
      $("#_211_of53a_party_identifier").attr("disabled", false);
      $("#_212_of53a_identifier_code").attr("disabled", false);
      $("#_214_of53d_party_identifier").attr("disabled", true);
      $("#_215_of53d_name_address").attr("disabled", true);
      $("#_216_of53j_party_identification").attr("disabled", true);
    } else if (
      $("#_214_of53d_party_identifier").val() != "" ||
      $("#_215_of53d_name_address").val() != ""
    ) {
      $("#type_of53_b2").val("d").attr("selected", true);
      $("#div_of53_a_b2").hide();
      $("#div_of53_d_b2").show();
      $("#div_of53_j_b2").hide();
      $("#_211_of53a_party_identifier").attr("disabled", true);
      $("#_212_of53a_identifier_code").attr("disabled", true);
      $("#_214_of53d_party_identifier").attr("disabled", false);
      $("#_215_of53d_name_address").attr("disabled", false);
      $("#_216_of53j_party_identification").attr("disabled", true);
    } else if ($("#_216_of53j_party_identification").val() != "") {
      $("#type_of53_b2").val("j").attr("selected", true);
      $("#div_of53_a_b2").hide();
      $("#div_of53_d_b2").hide();
      $("#div_of53_j_b2").show();
      $("#_211_of53a_party_identifier").attr("disabled", true);
      $("#_212_of53a_identifier_code").attr("disabled", true);
      $("#_214_of53d_party_identifier").attr("disabled", true);
      $("#_215_of53d_name_address").attr("disabled", true);
      $("#_216_of53j_party_identification").attr("disabled", false);
    } else {
      $("#div_of53_a_b2").hide();
      $("#div_of53_d_b2").hide();
      $("#div_of53_j_b2").hide();
      $("#_211_of53a_party_identifier").attr("disabled", true);
      $("#_212_of53a_identifier_code").attr("disabled", true);
      $("#_214_of53d_party_identifier").attr("disabled", true);
      $("#_215_of53d_name_address").attr("disabled", true);
      $("#_216_of53j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of56_a_d_j
    if (
      $("#_221_of56a_party_identifier").val() != "" ||
      $("#_222_of56a_identifier_code").val() != ""
    ) {
      $("#type_of56_b2").val("a").attr("selected", true);
      $("#div_of56_a_b2").show();
      $("#div_of56_d_b2").hide();
      $("#div_of56_j_b2").hide();
      $("#_221_of56a_party_identifier").attr("disabled", false);
      $("#_222_of56a_identifier_code").attr("disabled", false);
      $("#_224_of56d_party_identifier").attr("disabled", true);
      $("#_225_of56d_name_address").attr("disabled", true);
      $("#_226_of56j_party_identification").attr("disabled", true);
    } else if (
      $("#_224_of56d_party_identifier").val() != "" ||
      $("#_225_of56d_name_address").val() != ""
    ) {
      $("#type_of56_b2").val("d").attr("selected", true);
      $("#div_of56_a_b2").hide();
      $("#div_of56_d_b2").show();
      $("#div_of56_j_b2").hide();
      $("#_221_of56a_party_identifier").attr("disabled", true);
      $("#_222_of56a_identifier_code").attr("disabled", true);
      $("#_224_of56d_party_identifier").attr("disabled", false);
      $("#_225_of56d_name_address").attr("disabled", false);
      $("#_226_of56j_party_identification").attr("disabled", true);
    } else if ($("#_226_of56j_party_identification").val() != "") {
      $("#type_of56_b2").val("j").attr("selected", true);
      $("#div_of56_a_b2").hide();
      $("#div_of56_d_b2").hide();
      $("#div_of56_j_b2").show();
      $("#_221_of56a_party_identifier").attr("disabled", true);
      $("#_222_of56a_identifier_code").attr("disabled", true);
      $("#_224_of56d_party_identifier").attr("disabled", true);
      $("#_225_of56d_name_address").attr("disabled", true);
      $("#_226_of56j_party_identification").attr("disabled", false);
    } else {
      $("#div_of56_a_b2").hide();
      $("#div_of56_d_b2").hide();
      $("#div_of56_j_b2").hide();
      $("#_221_of56a_party_identifier").attr("disabled", true);
      $("#_222_of56a_identifier_code").attr("disabled", true);
      $("#_224_of56d_party_identifier").attr("disabled", true);
      $("#_225_of56d_name_address").attr("disabled", true);
      $("#_226_of56j_party_identification").attr("disabled", true);
    }
    //end of the line
    //mf57_a_d_j
    if (
      $("#_231_mf57a_party_identifier").val() != "" ||
      $("#_232_mf57a_identifier_code").val() != ""
    ) {
      $("#type_mf57_b2").val("a").attr("selected", true);
      $("#div_mf57_a_b2").show();
      $("#div_mf57_d_b2").hide();
      $("#div_mf57_j_b2").hide();
      $("#_231_mf57a_party_identifier").attr("disabled", false);
      $("#_232_mf57a_identifier_code").attr("disabled", false);
      $("#_234_mf57d_party_identifier").attr("disabled", true);
      $("#_235_mf57d_name_address").attr("disabled", true);
      $("#_236_mf57j_party_identification").attr("disabled", true);
    } else if (
      $("#_234_mf57d_party_identifier").val() != "" ||
      $("#_235_mf57d_name_address").val() != ""
    ) {
      $("#type_mf57_b2").val("d").attr("selected", true);
      $("#div_mf57_a_b2").hide();
      $("#div_mf57_d_b2").show();
      $("#div_mf57_j_b2").hide();
      $("#_231_mf57a_party_identifier").attr("disabled", true);
      $("#_232_mf57a_identifier_code").attr("disabled", true);
      $("#_234_mf57d_party_identifier").attr("disabled", false);
      $("#_235_mf57d_name_address").attr("disabled", false);
      $("#_236_mf57j_party_identification").attr("disabled", true);
    } else if ($("#_236_mf57j_party_identification").val() != "") {
      $("#type_mf57_b2").val("j").attr("selected", true);
      $("#div_mf57_a_b2").hide();
      $("#div_mf57_d_b2").hide();
      $("#div_mf57_j_b2").show();
      $("#_231_mf57a_party_identifier").attr("disabled", true);
      $("#_232_mf57a_identifier_code").attr("disabled", true);
      $("#_234_mf57d_party_identifier").attr("disabled", true);
      $("#_235_mf57d_name_address").attr("disabled", true);
      $("#_236_mf57j_party_identification").attr("disabled", false);
    } else {
      $("#div_mf57_a_b2").hide();
      $("#div_mf57_d_b2").hide();
      $("#div_mf57_j_b2").hide();
      $("#_231_mf57a_party_identifier").attr("disabled", true);
      $("#_232_mf57a_identifier_code").attr("disabled", true);
      $("#_234_mf57d_party_identifier").attr("disabled", true);
      $("#_235_mf57d_name_address").attr("disabled", true);
      $("#_236_mf57j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of58
    if (
      $("#_241_of58a_party_identifier").val() != "" ||
      $("#_242_of58a_identifier_code").val() != ""
    ) {
      $("#type_of58_").val("a").attr("selected", true);
      $("#div_of58_a").show();
      $("#div_of58_d").hide();
      $("#div_of58_j").hide();
      $("#_241_of58a_party_identifier").attr("disabled", false);
      $("#_242_of58a_identifier_code").attr("disabled", false);
      $("#_244_of58d_party_identifier").attr("disabled", true);
      $("#_245_of58d_name_address").attr("disabled", true);
      $("#_246_of58j_party_identification").attr("disabled", true);
    } else if (
      $("#_244_of58d_party_identifier").val() != "" ||
      $("#_245_of58d_name_address").val() != ""
    ) {
      $("#type_of58_").val("d").attr("selected", true);
      $("#div_of58_a").hide();
      $("#div_of58_d").show();
      $("#div_of58_j").hide();
      $("#_241_of58a_party_identifier").attr("disabled", true);
      $("#_242_of58a_identifier_code").attr("disabled", true);
      $("#_244_of58d_party_identifier").attr("disabled", false);
      $("#_245_of58d_name_address").attr("disabled", false);
      $("#_246_of58j_party_identification").attr("disabled", true);
    } else if ($("#_246_of58j_party_identification").val() != "") {
      $("#type_of58_").val("j").attr("selected", true);
      $("#div_of58_a").hide();
      $("#div_of58_d").hide();
      $("#div_of58_j").show();
      $("#_241_of58a_party_identifier").attr("disabled", true);
      $("#_242_of58a_identifier_code").attr("disabled", true);
      $("#_244_of58d_party_identifier").attr("disabled", true);
      $("#_245_of58d_name_address").attr("disabled", true);
      $("#_246_of58j_party_identification").attr("disabled", false);
    } else {
      $("#div_of58_a").hide();
      $("#div_of58_d").hide();
      $("#div_of58_j").hide();
      $("#_241_of58a_party_identifier").attr("disabled", true);
      $("#_242_of58a_identifier_code").attr("disabled", true);
      $("#_244_of58d_party_identifier").attr("disabled", true);
      $("#_245_of58d_name_address").attr("disabled", true);
      $("#_246_of58j_party_identification").attr("disabled", true);
    }
    //end of the line
    //Optional Sequence C Optional General Information
    //of84_a_b_d_j
    if (
      $("#_271_of84a_party_identifier").val() != "" ||
      $("#_272_of84a_identifier_code").val() != ""
    ) {
      $("#type_of84_").val("a").attr("selected", true);
      $("#div_of84_a").show();
      $("#div_of84_b").hide();
      $("#div_of84_d").hide();
      $("#div_of84_j").hide();
      $("#_271_of84a_party_identifier").attr("disabled", false);
      $("#_272_of84a_identifier_code").attr("disabled", false);
      $("#_274_of84b_party_identifier").attr("disabled", true);
      $("#_275_of84b_location").attr("disabled", true);
      $("#_276_of84d_party_identifier").attr("disabled", true);
      $("#_277_of84d_name_and_address").attr("disabled", true);
      $("#_278_of84j_party_identification").attr("disabled", true);
    } else if (
      $("#_274_of84b_party_identifier").val() != "" ||
      $("#_275_of84b_location").val() != ""
    ) {
      $("#type_of84_").val("b").attr("selected", true);
      $("#div_of84_a").hide();
      $("#div_of84_b").show();
      $("#div_of84_d").hide();
      $("#div_of84_j").hide();
      $("#_271_of84a_party_identifier").attr("disabled", true);
      $("#_272_of84a_identifier_code").attr("disabled", true);
      $("#_274_of84b_party_identifier").attr("disabled", false);
      $("#_275_of84b_location").attr("disabled", false);
      $("#_276_of84d_party_identifier").attr("disabled", true);
      $("#_277_of84d_name_and_address").attr("disabled", true);
      $("#_278_of84j_party_identification").attr("disabled", true);
    } else if (
      $("#_276_of84d_party_identifier").val() != "" ||
      $("#_277_of84d_name_and_address").val() != ""
    ) {
      $("#type_of84_").val("d").attr("selected", true);
      $("#div_of84_a").hide();
      $("#div_of84_b").hide();
      $("#div_of84_d").show();
      $("#div_of84_j").hide();
      $("#_271_of84a_party_identifier").attr("disabled", true);
      $("#_272_of84a_identifier_code").attr("disabled", true);
      $("#_274_of84b_party_identifier").attr("disabled", true);
      $("#_275_of84b_location").attr("disabled", true);
      $("#_276_of84d_party_identifier").attr("disabled", false);
      $("#_277_of84d_name_and_address").attr("disabled", false);
      $("#_278_of84j_party_identification").attr("disabled", true);
    } else if ($("#_278_of84j_party_identification").val() != "") {
      $("#type_of84_").val("j").attr("selected", true);
      $("#div_of84_a").hide();
      $("#div_of84_b").hide();
      $("#div_of84_d").hide();
      $("#div_of84_j").show();
      $("#_271_of84a_party_identifier").attr("disabled", true);
      $("#_272_of84a_identifier_code").attr("disabled", true);
      $("#_274_of84b_party_identifier").attr("disabled", true);
      $("#_275_of84b_location").attr("disabled", true);
      $("#_276_of84d_party_identifier").attr("disabled", true);
      $("#_277_of84d_name_and_address").attr("disabled", true);
      $("#_278_of84j_party_identification").attr("disabled", false);
    } else {
      $("#div_of84_a").hide();
      $("#div_of84_b").hide();
      $("#div_of84_d").hide();
      $("#div_of84_j").hide();
      $("#_271_of84a_party_identifier").attr("disabled", true);
      $("#_272_of84a_identifier_code").attr("disabled", true);
      $("#_274_of84b_party_identifier").attr("disabled", true);
      $("#_275_of84b_location").attr("disabled", true);
      $("#_276_of84d_party_identifier").attr("disabled", true);
      $("#_277_of84d_name_and_address").attr("disabled", true);
      $("#_278_of84j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of85_a_b_d_j
    if (
      $("#_281_of85a_party_identifier").val() != "" ||
      $("#_282_of85a_identifier_code").val() != ""
    ) {
      $("#type_of85_").val("a").attr("selected", true);
      $("#div_of85_a").show();
      $("#div_of85_b").hide();
      $("#div_of85_d").hide();
      $("#div_of85_j").hide();
      $("#_281_of85a_party_identifier").attr("disabled", false);
      $("#_282_of85a_identifier_code").attr("disabled", false);
      $("#_284_of85b_party_identifier").attr("disabled", true);
      $("#_285_of85b_location").attr("disabled", true);
      $("#_286_of85d_party_identifier").attr("disabled", true);
      $("#_287_of85d_name_and_address").attr("disabled", true);
      $("#_288_of85j_party_identification").attr("disabled", true);
    } else if (
      $("#_284_of85b_party_identifier").val() != "" ||
      $("#_285_of85b_location").val() != ""
    ) {
      $("#type_of85_").val("b").attr("selected", true);
      $("#div_of85_a").hide();
      $("#div_of85_b").show();
      $("#div_of85_d").hide();
      $("#div_of85_j").hide();
      $("#_281_of85a_party_identifier").attr("disabled", true);
      $("#_282_of85a_identifier_code").attr("disabled", true);
      $("#_284_of85b_party_identifier").attr("disabled", false);
      $("#_285_of85b_location").attr("disabled", false);
      $("#_286_of85d_party_identifier").attr("disabled", true);
      $("#_287_of85d_name_and_address").attr("disabled", true);
      $("#_288_of85j_party_identification").attr("disabled", true);
    } else if (
      $("#_286_of85d_party_identifier").val() != "" ||
      $("#_287_of85d_name_and_address").val() != ""
    ) {
      $("#type_of85_").val("d").attr("selected", true);
      $("#div_of85_a").hide();
      $("#div_of85_b").hide();
      $("#div_of85_d").show();
      $("#div_of85_j").hide();
      $("#_281_of85a_party_identifier").attr("disabled", true);
      $("#_282_of85a_identifier_code").attr("disabled", true);
      $("#_284_of85b_party_identifier").attr("disabled", true);
      $("#_285_of85b_location").attr("disabled", true);
      $("#_286_of85d_party_identifier").attr("disabled", false);
      $("#_287_of85d_name_and_address").attr("disabled", false);
      $("#_288_of85j_party_identification").attr("disabled", true);
    } else if ($("#_288_of85j_party_identification").val() != "") {
      $("#type_of85_").val("j").attr("selected", true);
      $("#div_of85_a").hide();
      $("#div_of85_b").hide();
      $("#div_of85_d").hide();
      $("#div_of85_j").show();
      $("#_281_of85a_party_identifier").attr("disabled", true);
      $("#_282_of85a_identifier_code").attr("disabled", true);
      $("#_284_of85b_party_identifier").attr("disabled", true);
      $("#_285_of85b_location").attr("disabled", true);
      $("#_286_of85d_party_identifier").attr("disabled", true);
      $("#_287_of85d_name_and_address").attr("disabled", true);
      $("#_288_of85j_party_identification").attr("disabled", false);
    } else {
      $("#div_of85_a").hide();
      $("#div_of85_b").hide();
      $("#div_of85_d").hide();
      $("#div_of85_j").hide();
      $("#_281_of85a_party_identifier").attr("disabled", true);
      $("#_282_of85a_identifier_code").attr("disabled", true);
      $("#_284_of85b_party_identifier").attr("disabled", true);
      $("#_285_of85b_location").attr("disabled", true);
      $("#_286_of85d_party_identifier").attr("disabled", true);
      $("#_287_of85d_name_and_address").attr("disabled", true);
      $("#_288_of85j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of88_a_d_j
    if (
      $("#_291_of88a_party_identifier").val() != "" ||
      $("#_292_of88a_identifier_code").val() != ""
    ) {
      $("#type_of88_").val("a").attr("selected", true);
      $("#div_of88_a").show();
      $("#div_of88_d").hide();
      $("#div_of88_j").hide();
      $("#_291_of88a_party_identifier").attr("disabled", false);
      $("#_292_of88a_identifier_code").attr("disabled", false);
      $("#_294_of88d_party_identifier").attr("disabled", true);
      $("#_295_of88d_name_and_address").attr("disabled", true);
      $("#_296_of88j_party_identification").attr("disabled", true);
    } else if (
      $("#_294_of88d_party_identifier").val() != "" ||
      $("#_295_of88d_name_and_address").val() != ""
    ) {
      $("#type_of88_").val("d").attr("selected", true);
      $("#div_of88_a").hide();
      $("#div_of88_d").show();
      $("#div_of88_j").hide();
      $("#_291_of88a_party_identifier").attr("disabled", true);
      $("#_292_of88a_identifier_code").attr("disabled", true);
      $("#_294_of88d_party_identifier").attr("disabled", false);
      $("#_295_of88d_name_and_address").attr("disabled", false);
      $("#_296_of88j_party_identification").attr("disabled", true);
    } else if ($("#_296_of88j_party_identification").val() != "") {
      $("#type_of88_").val("j").attr("selected", true);
      $("#div_of88_a").hide();
      $("#div_of88_d").hide();
      $("#div_of88_j").show();
      $("#_291_of88a_party_identifier").attr("disabled", true);
      $("#_292_of88a_identifier_code").attr("disabled", true);
      $("#_294_of88d_party_identifier").attr("disabled", true);
      $("#_295_of88d_name_and_address").attr("disabled", true);
      $("#_296_of88j_party_identification").attr("disabled", false);
    } else {
      $("#div_of88_a").hide();
      $("#div_of88_d").hide();
      $("#div_of88_j").hide();
      $("#_291_of88a_party_identifier").attr("disabled", true);
      $("#_292_of88a_identifier_code").attr("disabled", true);
      $("#_294_of88d_party_identifier").attr("disabled", true);
      $("#_295_of88d_name_and_address").attr("disabled", true);
      $("#_296_of88j_party_identification").attr("disabled", true);
    }
    //end of the line
    //OF29a
    if ($("#_250_of29a_contact_information").val() != "") {
      $("#contact_information_checkbox").attr("checked", true);
      $("#check_of29a").show();
      $("#_250_of29a_contact_information").attr("disabled", false);
    } else {
      $("#check_of29a").hide();
      $("#_250_of29a_contact_information").attr("disabled", true);
    }
    //end of the line
    //of24d
    if (
      $("#_260_of24d_dealing_method").val() != "" ||
      $("#_261_of24d_additional_information").val() != ""
    ) {
      $("#dealing_method_checkbox").attr("checked", true);
      $("#check_of24d").show();
      $("#_260_of24d_dealing_method").attr("disabled", false);
      $("#_261_of24d_additional_information").attr("disabled", false);
    } else {
      $("#check_of24d").hide();
      $("#_260_of24d_dealing_method").attr("disabled", true);
      $("#_261_of24d_additional_information").attr("disabled", true);
    }
    //end of the line
    //of71f
    if (
      $("#_300_of71f_currency").val() != "" ||
      $("#_301_of71f_amount").val() != ""
    ) {
      $("#broker_commission_checkbox").attr("checked", true);
      $("#check_of71f").show();
      $("#_300_of71f_currency").attr("disabled", false);
      $("#_301_of71f_amount").attr("disabled", false);
    } else {
      $("#check_of71f").hide();
      $("#_300_of71f_currency").attr("disabled", true);
      $("#_301_of71f_amount").attr("disabled", true);
    }
    //end of the line
    //of26h
    if ($("#_310_of26h_counterpartys_reference").val() != "") {
      $("#counterparty_reference_checkbox").attr("checked", true);
      $("#check_of26h").show();
      $("#_310_of26h_counterpartys_reference").attr("disabled", false);
    } else {
      $("#check_of26h").hide();
      $("#_310_of26h_counterpartys_reference").attr("disabled", true);
    }
    //end of the line
    //of21g
    if ($("#_320_of21g_brokers_reference").val() != "") {
      $("#brokers_reference_checkbox").attr("checked", true);
      $("#check_of21g").show();
      $("#_320_of21g_brokers_reference").attr("disabled", false);
    } else {
      $("#check_of21g").hide();
      $("#_320_of21g_brokers_reference").attr("disabled", true);
    }
    //end of the line
    //of72
    if (
      $("#_330_of72_code").val() != "" ||
      $("#_331_of72_narrative").val() != ""
    ) {
      $("#sender_to_receiver_information_checkbox").attr("checked", true);
      $("#check_of72").show();
      $("#_330_of72_code").attr("disabled", false);
      $("#_331_of72_narrative").attr("disabled", false);
    } else {
      $("#check_of72").hide();
      $("#_330_of72_code").attr("disabled", true);
      $("#_331_of72_narrative").attr("disabled", true);
    }
    //end of the line
    //Optional Sequence D Split Settlement Details
    //of53_a_d_j
    if (
      $("#_371_of53a_party_identifier").val() != "" ||
      $("#_372_of53a_identifier_code").val() != ""
    ) {
      $("#type_of53_d").val("a").attr("selected", true);
      $("#div_of53_a_d").show();
      $("#div_of53_d_d").hide();
      $("#div_of53_j_d").hide();
      $("#_371_of53a_party_identifier").attr("disabled", false);
      $("#_372_of53a_identifier_code").attr("disabled", false);
      $("#_374_of53d_party_identifier").attr("disabled", true);
      $("#_375_of53d_name_address").attr("disabled", true);
      $("#_376_of53j_party_identification").attr("disabled", true);
    } else if (
      $("#_374_of53d_party_identifier").val() != "" ||
      $("#_375_of53d_name_address").val() != ""
    ) {
      $("#type_of53_d").val("d").attr("selected", true);
      $("#div_of53_a_d").hide();
      $("#div_of53_d_d").show();
      $("#div_of53_j_d").hide();
      $("#_371_of53a_party_identifier").attr("disabled", true);
      $("#_372_of53a_identifier_code").attr("disabled", true);
      $("#_374_of53d_party_identifier").attr("disabled", false);
      $("#_375_of53d_name_address").attr("disabled", false);
      $("#_376_of53j_party_identification").attr("disabled", true);
    } else if ($("#_376_of53j_party_identification").val() != "") {
      $("#type_of53_d").val("j").attr("selected", true);
      $("#div_of53_a_d").hide();
      $("#div_of53_d_d").hide();
      $("#div_of53_j_d").show();
      $("#_371_of53a_party_identifier").attr("disabled", true);
      $("#_372_of53a_identifier_code").attr("disabled", true);
      $("#_374_of53d_party_identifier").attr("disabled", true);
      $("#_375_of53d_name_address").attr("disabled", true);
      $("#_376_of53j_party_identification").attr("disabled", false);
    } else {
      $("#div_of53_a_d").hide();
      $("#div_of53_d_d").hide();
      $("#div_of53_j_d").hide();
      $("#_371_of53a_party_identifier").attr("disabled", true);
      $("#_372_of53a_identifier_code").attr("disabled", true);
      $("#_374_of53d_party_identifier").attr("disabled", true);
      $("#_375_of53d_name_address").attr("disabled", true);
      $("#_376_of53j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of56_a_d_j
    if (
      $("#_381_of56a_party_identifier").val() != "" ||
      $("#_382_of56a_identifier_code").val() != ""
    ) {
      $("#type_of56_d").val("a").attr("selected", true);
      $("#div_of56_a_d").show();
      $("#div_of56_d_d").hide();
      $("#div_of56_j_d").hide();
      $("#_381_of56a_party_identifier").attr("disabled", false);
      $("#_382_of56a_identifier_code").attr("disabled", false);
      $("#_384_of56d_party_identifier").attr("disabled", true);
      $("#_385_of56d_name_address").attr("disabled", true);
      $("#_386_of56j_party_identification").attr("disabled", true);
    } else if (
      $("#_384_of56d_party_identifier").val() != "" ||
      $("#_385_of56d_name_address").val() != ""
    ) {
      $("#type_of56_d").val("d").attr("selected", true);
      $("#div_of56_a_d").hide();
      $("#div_of56_d_d").show();
      $("#div_of56_j_d").hide();
      $("#_381_of56a_party_identifier").attr("disabled", true);
      $("#_382_of56a_identifier_code").attr("disabled", true);
      $("#_384_of56d_party_identifier").attr("disabled", false);
      $("#_385_of56d_name_address").attr("disabled", false);
      $("#_386_of56j_party_identification").attr("disabled", true);
    } else if ($("#_386_of56j_party_identification").val() != "") {
      $("#type_of56_d").val("j").attr("selected", true);
      $("#div_of56_a_d").hide();
      $("#div_of56_d_d").hide();
      $("#div_of56_j_d").show();
      $("#_381_of56a_party_identifier").attr("disabled", true);
      $("#_382_of56a_identifier_code").attr("disabled", true);
      $("#_384_of56d_party_identifier").attr("disabled", true);
      $("#_385_of56d_name_address").attr("disabled", true);
      $("#_386_of56j_party_identification").attr("disabled", false);
    } else {
      $("#div_of56_a_d").hide();
      $("#div_of56_d_d").hide();
      $("#div_of56_j_d").hide();
      $("#_381_of56a_party_identifier").attr("disabled", true);
      $("#_382_of56a_identifier_code").attr("disabled", true);
      $("#_384_of56d_party_identifier").attr("disabled", true);
      $("#_385_of56d_name_address").attr("disabled", true);
      $("#_386_of56j_party_identification").attr("disabled", true);
    }
    //end of the line
    //mf57_a_d_j
    if (
      $("#_391_mf57a_party_identifier").val() != "" ||
      $("#_392_mf57a_identifier_code").val() != ""
    ) {
      $("#type_mf57_d").val("a").attr("selected", true);
      $("#div_mf57_a_d").show();
      $("#div_mf57_d_d").hide();
      $("#div_mf57_j_d").hide();
      $("#_391_mf57a_party_identifier").attr("disabled", false);
      $("#_392_mf57a_identifier_code").attr("disabled", false);
      $("#_394_mf57d_party_identifier").attr("disabled", true);
      $("#_395_mf57d_name_address").attr("disabled", true);
      $("#_396_mf57j_party_identification").attr("disabled", true);
    } else if (
      $("#_394_mf57d_party_identifier").val() != "" ||
      $("#_395_mf57d_name_address").val() != ""
    ) {
      $("#type_mf57_d").val("d").attr("selected", true);
      $("#div_mf57_a_d").hide();
      $("#div_mf57_d_d").show();
      $("#div_mf57_j_d").hide();
      $("#_391_mf57a_party_identifier").attr("disabled", true);
      $("#_392_mf57a_identifier_code").attr("disabled", true);
      $("#_394_mf57d_party_identifier").attr("disabled", false);
      $("#_395_mf57d_name_address").attr("disabled", false);
      $("#_396_mf57j_party_identification").attr("disabled", true);
    } else if ($("#_396_mf57j_party_identification").val() != "") {
      $("#type_mf57_d").val("j").attr("selected", true);
      $("#div_mf57_a_d").hide();
      $("#div_mf57_d_d").hide();
      $("#div_mf57_j_d").show();
      $("#_391_mf57a_party_identifier").attr("disabled", true);
      $("#_392_mf57a_identifier_code").attr("disabled", true);
      $("#_394_mf57d_party_identifier").attr("disabled", true);
      $("#_395_mf57d_name_address").attr("disabled", true);
      $("#_396_mf57j_party_identification").attr("disabled", false);
    } else {
      $("#div_mf57_a_d").hide();
      $("#div_mf57_d_d").hide();
      $("#div_mf57_j_d").hide();
      $("#_391_mf57a_party_identifier").attr("disabled", true);
      $("#_392_mf57a_identifier_code").attr("disabled", true);
      $("#_394_mf57d_party_identifier").attr("disabled", true);
      $("#_395_mf57d_name_address").attr("disabled", true);
      $("#_396_mf57j_party_identification").attr("disabled", true);
    }
    //end of the line
    //of58_a_d_j
    if (
      $("#_401_of58a_party_identifier").val() != "" ||
      $("#_402_of58a_identifier_code").val() != ""
    ) {
      $("#type_of58_d").val("a").attr("selected", true);
      $("#div_of58_a_d").show();
      $("#div_of58_d_d").hide();
      $("#div_of58_j_d").hide();
      $("#_401_of58a_party_identifier").attr("disabled", false);
      $("#_402_of58a_identifier_code").attr("disabled", false);
      $("#_404_of58d_party_identifier").attr("disabled", true);
      $("#_405_of58d_name_address").attr("disabled", true);
      $("#_406_of58j_party_identification").attr("disabled", true);
    } else if (
      $("#_404_of58d_party_identifier").val() != "" ||
      $("#_405_of58d_name_address").val() != ""
    ) {
      $("#type_of58_d").val("d").attr("selected", true);
      $("#div_of58_a_d").hide();
      $("#div_of58_d_d").show();
      $("#div_of58_j_d").hide();
      $("#_401_of58a_party_identifier").attr("disabled", true);
      $("#_402_of58a_identifier_code").attr("disabled", true);
      $("#_404_of58d_party_identifier").attr("disabled", false);
      $("#_405_of58d_name_address").attr("disabled", false);
      $("#_406_of58j_party_identification").attr("disabled", true);
    } else if ($("#_406_of58j_party_identification").val() != "") {
      $("#type_of58_d").val("j").attr("selected", true);
      $("#div_of58_a_d").hide();
      $("#div_of58_d_d").hide();
      $("#div_of58_j_d").show();
      $("#_401_of58a_party_identifier").attr("disabled", true);
      $("#_402_of58a_identifier_code").attr("disabled", true);
      $("#_404_of58d_party_identifier").attr("disabled", true);
      $("#_405_of58d_name_address").attr("disabled", true);
      $("#_406_of58j_party_identification").attr("disabled", false);
    } else {
      $("#div_of58_a_d").hide();
      $("#div_of58_d_d").hide();
      $("#div_of58_j_d").hide();
      $("#_401_of58a_party_identifier").attr("disabled", true);
      $("#_402_of58a_identifier_code").attr("disabled", true);
      $("#_404_of58d_party_identifier").attr("disabled", true);
      $("#_405_of58d_name_address").attr("disabled", true);
      $("#_406_of58j_party_identification").attr("disabled", true);
    }
    //end of the line
    //Seq C checkbox
    if (
      $("#_260_of24d_dealing_method").val() != "" ||
      $("#_330_of72_code").val() != "" ||
      $("#_272_of84a_identifier_code").val() != "" ||
      $("#_277_of84d_name_and_address").val() != "" ||
      $("#_278_of84j_party_identification").val() != "" ||
      $("#_282_of85a_identifier_code").val() != "" ||
      $("#_287_of85d_name_and_address").val() != "" ||
      $("#_288_of85j_party_identification").val() != "" ||
      $("#_292_of88a_identifier_code").val() != "" ||
      $("#_295_of88d_name_and_address").val() != "" ||
      $("#_296_of88j_party_identification").val() != ""
    ) {
      $("#seq_C_checkbox").attr("checked", true);
      $("#check_seq_c").show();
      $("#_260_of24d_dealing_method").attr("disabled", false);
      $("#_330_of72_code").attr("disabled", false);
      $("#_272_of84a_identifier_code").attr("disabled", false);
      $("#_277_of84d_name_and_address").attr("disabled", false);
      $("#_278_of84j_party_identification").attr("disabled", false);
      $("#_282_of85a_identifier_code").attr("disabled", false);
      $("#_287_of85d_name_and_address").attr("disabled", false);
      $("#_288_of85j_party_identification").attr("disabled", false);
      $("#_292_of88a_identifier_code").attr("disabled", false);
      $("#_295_of88d_name_and_address").attr("disabled", false);
      $("#_296_of88j_party_identification").attr("disabled", false);
    } else {
      $("#check_seq_c").hide();
      $("#_260_of24d_dealing_method").attr("disabled", true);
      $("#_330_of72_code").attr("disabled", true);
      $("#_272_of84a_identifier_code").attr("disabled", true);
      $("#_277_of84d_name_and_address").attr("disabled", true);
      $("#_278_of84j_party_identification").attr("disabled", true);
      $("#_282_of85a_identifier_code").attr("disabled", true);
      $("#_287_of85d_name_and_address").attr("disabled", true);
      $("#_288_of85j_party_identification").attr("disabled", true);
      $("#_292_of88a_identifier_code").attr("disabled", true);
      $("#_295_of88d_name_and_address").attr("disabled", true);
      $("#_296_of88j_party_identification").attr("disabled", true);
    }
    //end of the line
    //Seq D checkbox
    if ($("#_410_mf16a_number_of_settlements").val() != "") {
      $("#seq_D_checkbox").attr("checked", true);
      $("#check_seq_d").show();
      $("#_410_mf16a_number_of_settlements").attr("disabled", false);
    } else {
      $("#check_seq_d").hide();
      $("#_410_mf16a_number_of_settlements").attr("disabled", true);
    }
    //end of the line
    //Check_of14s
    //        if ($("#check_ofcc1").val() != "" || $("#check_ofcc2").val() != "") {
    //        if ($("#occ_1_chexbox").val() != "" || $("#occ_2_checkbox").val() != "") {
    ////            $("#settlement_rate_source_checkbox").attr("checked", true);
    //            $("#check_of14s").show();
    //            $("#check_ofcc1").attr("disabled", false);
    //            $("#check_ofcc2").attr("disabled", false);
    //        } else {
    //            $("#check_of14s").hide();
    //            $("#check_ofcc1").attr("disabled", true);
    //            $("#check_ofcc2").attr("disabled", true);
    //        }
    //end of the line
    //check_of14s_occ_1
    if ($("#_106_of14s_rate_source").val() != "") {
      $("#occ_1_chexbox").attr("checked", true);
      $("#check_ofcc1").show();
      $("#check_of14s").show();
      $("#_106_of14s_rate_source").attr("disabled", false);
      $("#settlement_rate_source_checkbox").attr("checked", true);
    } else {
      $("#check_ofcc1").hide();
      $("#_106_of14s_rate_source").attr("disabled", true);
    }
    //end of the line
    //check_of14s_occ_1_check_oftl_I
    if ($("#_107_of14s_time").val() != "") {
      $("#time_and_location_I_checkbox").attr("checked", true);
      $("#check_oftl_I").show();
      $("#_107_of14s_time").attr("disabled", false);
      $("#_108_of14s_location").attr("disabled", false);
    } else {
      $("#check_oftl_I").hide();
      $("#_107_of14s_time").attr("disabled", true);
      $("#_108_of14s_location").attr("disabled", true);
    }
    //end of the line
    //check_of14s_occ_2
    if ($("#_109_of14s_rate_resource").val() != "") {
      $("#occ_2_checkbox").attr("checked", true);
      $("#check_ofcc2").show();
      $("#check_of14s").show();
      $("#_109_of14s_rate_resource").attr("disabled", false);
      $("#settlement_rate_source_checkbox").attr("checked", true);
    } else {
      $("#check_ofcc2").hide();
      $("#_109_of14s_rate_resource").attr("disabled", true);
    }
    //end of the line
    //check_of14s_occ_1_check_oftl_II
    if ($("#_110_of14s_time").val() != "") {
      $("#time_and_location_II_checkbox").attr("checked", true);
      $("#check_oftl_II").show();
      $("#_110_of14s_time").attr("disabled", false);
      $("#_111_of14s_location").attr("disabled", false);
    } else {
      $("#check_oftl_II").hide();
      $("#_110_of14s_time").attr("disabled", true);
      $("#_111_of14s_location").attr("disabled", true);
    }
    //end of the line
    //check_of_21
    if ($("#_020_of21_related_reference").val() != "") {
      $("#related_reference_checkbox").attr("checked", true);
      $("#check_of21").show();
      $("#_020_of21_related_reference").attr("disabled", false);
    } else {
      $("#check_of21").hide();
      $("#_020_of21_related_reference").attr("disabled", true);
    }
    //end of the line
    //check_of_94a
    if ($("#_040_of94a_scope_of_operation").val() != "") {
      $("#scope_of_operation_checkbox").attr("checked", true);
      $("#check_of94a").show();
      $("#_040_of94a_scope_of_operation").attr("disabled", false);
    } else {
      $("#check_of94a").hide();
      $("#_040_of94a_scope_of_operation").attr("disabled", true);
    }
    //end of the line
    //check_of17t
    if ($("#_050_of17t_block_trade_indicator").val() != "") {
      $("#block_trade_indicator_checkbox").attr("checked", true);
      $("#check_of17t").show();
      $("#_050_of17t_block_trade_indicator").attr("disabled", false);
    } else {
      $("#check_of17t").hide();
      $("#_050_of17t_block_trade_indicator").attr("disabled", true);
    }
    //end of the line
    //check_of17u
    if ($("#_060_of17u_split_settlement_indicator").val() != "") {
      $("#split_settlement_indicator_checkbox").attr("checked", true);
      $("#check_of17u").show();
      $("#_060_of17u_split_settlement_indicator").attr("disabled", false);
    } else {
      $("#check_of17u").hide();
      $("#_060_of17u_split_settlement_indicator").attr("disabled", true);
    }
    //end of the line
    //check_of17i
    if (
      $("#_065_of17i_payment_versus_payment_settlement_indicator").val() != ""
    ) {
      $("#payment_versus_payment_settlement_indicator_checkbox").attr(
        "checked",
        true
      );
      $("#check_of17i").show();
      $("#_065_of17i_payment_versus_payment_settlement_indicator").attr(
        "disabled",
        false
      );
    } else {
      $("#check_of17i").hide();
      $("#_065_of17i_payment_versus_payment_settlement_indicator").attr(
        "disabled",
        true
      );
    }
    //end of the line
    //check_of83
    if ($("#type_of83_").val() != "") {
      $("#fund_or_instructing_party_checkbox").attr("checked", true);
      $("#check_of83").show();
      $("#type_of83_").attr("disabled", false);
    } else {
      $("#check_of83").hide();
      $("#type_of83_").attr("disabled", true);
    }
    //end of the line
    //check_of77d
    if ($("#_100_of77d_terms_and_conditions").val() != "") {
      $("#terms_and_conditions_checkbox").attr("checked", true);
      $("#check_of77d").show();
      $("#_100_of77d_terms_and_conditions").attr("disabled", false);
    } else {
      $("#check_of77d").hide();
      $("#_100_of77d_terms_and_conditions").attr("disabled", true);
    }
    //end of the line
    //check_of14c
    if ($("#_101_of14c_year_of_definitions").val() != "") {
      $("#year_of_definitions_checkbox").attr("checked", true);
      $("#check_of14c").show();
      $("#_101_of14c_year_of_definitions").attr("disabled", false);
    } else {
      $("#check_of14c").hide();
      $("#_101_of14c_year_of_definitions").attr("disabled", true);
    }
    //end of the line
    //check_of17f
    if ($("#_102_of17f_non_deliverable_indicator").val() != "") {
      $("#deliverable_indicator_checkbox").attr("checked", true);
      $("#check_of17f").show();
      $("#_102_of17f_non_deliverable_indicator").attr("disabled", false);
    } else {
      $("#check_of17f").hide();
      $("#_102_of17f_non_deliverable_indicator").attr("disabled", true);
    }
    //end of the line
    //check_of17o
    if ($("#_103_of17o_ndf_open_indicator").val() != "") {
      $("#NDF_open_indicator_checkbox").attr("checked", true);
      $("#check_of17o").show();
      $("#_103_of17o_ndf_open_indicator").attr("disabled", false);
    } else {
      $("#check_of17o").hide();
      $("#_103_of17o_ndf_open_indicator").attr("disabled", true);
    }
    //end of the line
    //check_of32e
    if ($("#_104_of32e_currency").val() != "") {
      $("#settlement_currency_checkbox").attr("checked", true);
      $("#check_of32e").show();
      $("#_104_of32e_currency").attr("disabled", false);
    } else {
      $("#check_of32e").hide();
      $("#_104_of32e_currency").attr("disabled", true);
    }
    //end of the line
    //check_of30u
    if ($("#value_date_6").val() != "") {
      $("#valuation_date_checkbox").attr("checked", true);
      $("#check_of30u").show();
      $("#value_date_6").attr("disabled", false);
    } else {
      $("#check_of30u").hide();
      $("#value_date_6").attr("disabled", true);
    }
    //end of the line
    //check_of84
    if ($("#type_of84_").val() != "") {
      $("#dealing_branch_party_A_checkbox").attr("checked", true);
      $("#check_of84").show();
      $("#type_of84_").attr("disabled", false);
    } else {
      $("#check_of84").hide();
      $("#type_of84_").attr("disabled", true);
    }
    //end of the line
    //check_of85
    if ($("#type_of85_").val() != "") {
      $("#dealing_branch_party_B_checkbox").attr("checked", true);
      $("#check_of85").show();
      $("#type_of85_").attr("disabled", false);
    } else {
      $("#check_of85").hide();
      $("#type_of85_").attr("disabled", true);
    }
    //end of the line
    //check_of88
    if ($("#type_of88_").val() != "") {
      $("#broker_identification_checkbox").attr("checked", true);
      $("#check_of88").show();
      $("#type_of88_").attr("disabled", false);
    } else {
      $("#check_of88").hide();
      $("#type_of88_").attr("disabled", true);
    }
    //end of the line
  });
</script>
