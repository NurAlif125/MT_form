function loadCss(filename) {
  var link = document.createElement("link");
  link.rel = "stylesheet";
  link.type = "text/css";
  link.href = filename;
  document.head.appendChild(link);
}

$(document).ready(function () {
  let validator = $("#form1").validate({
    ignore: [],
    onkeyup: false, // Nonaktifkan validasi saat mengetik
    onfocusout: false,
    rules: mt400_content.rules,
    messages: mt400_content.messages,
    errorPlacement: function (error, element) {
      error.insertAfter(element);
      $("#tab-validate").removeAttr("hidden");
    },
    showErrors: function (errorMap, errorList) {
      this.defaultShowErrors();

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
        tableHTML +=
          '<td style="padding: 5px;">' + errors.message + "</td></tr>";
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

  $.validator.addMethod(
    "fieldValidator",
    function (value, element, param) {
      if (this.optional(element)) return true;

      let regexPattern = new RegExp(param);
      return regexPattern.test(value);
    },
    "Format tidak valid"
  );
});

loadCss("../../css/validate.css");

$(document).ready(function () {
  //mf32//
  $("#div_mf32a").hide();
  $("#div_mf32b").hide();
  $("#div_mf32k").hide();
  $("#_031_mf32a_date").attr("disabled", true);
  $("#_032_mf32a_currency").attr("disabled", true);
  $("#_033_mf32a_amount").attr("disabled", true);
  $("#_034_mf32b_currency").attr("disabled", true);
  $("#_035_mf32b_amount").attr("disabled", true);
  $("#_036_mf32k_daysmonth").attr("disabled", true);
  $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
  $("#_038_mf32k_code").attr("disabled", true);
  $("#_039_mf32k_currency").attr("disabled", true);
  $("#_040_mf32k_amount").attr("disabled", true);

  $("#type_mf32_amount_collected").change(function () {
    if ($("#type_mf32_amount_collected").val() == "a") {
      $("#div_mf32a").show();
      $("#div_mf32b").hide();
      $("#div_mf32k").hide();
      $("#_031_mf32a_date").attr("disabled", false);
      $("#_032_mf32a_currency").attr("disabled", false);
      $("#_033_mf32a_amount").attr("disabled", false);
      $("#_034_mf32b_currency").attr("disabled", true);
      $("#_035_mf32b_amount").attr("disabled", true);
      $("#_036_mf32k_daysmonth").attr("disabled", true);
      $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
      $("#_038_mf32k_code").attr("disabled", true);
      $("#_039_mf32k_currency").attr("disabled", true);
      $("#_040_mf32k_amount").attr("disabled", true);
    } else if ($("#type_mf32_amount_collected").val() == "b") {
      $("#div_mf32a").hide();
      $("#div_mf32b").show();
      $("#div_mf32k").hide();
      $("#_031_mf32a_date").attr("disabled", true);
      $("#_032_mf32a_currency").attr("disabled", true);
      $("#_033_mf32a_amount").attr("disabled", true);
      $("#_034_mf32b_currency").attr("disabled", false);
      $("#_035_mf32b_amount").attr("disabled", false);
      $("#_036_mf32k_daysmonth").attr("disabled", true);
      $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
      $("#_038_mf32k_code").attr("disabled", true);
      $("#_039_mf32k_currency").attr("disabled", true);
      $("#_040_mf32k_amount").attr("disabled", true);
    } else if ($("#type_mf32_amount_collected").val() == "k") {
      $("#div_mf32a").hide();
      $("#div_mf32b").hide();
      $("#div_mf32k").show();
      $("#_031_mf32a_date").attr("disabled", true);
      $("#_032_mf32a_currency").attr("disabled", true);
      $("#_033_mf32a_amount").attr("disabled", true);
      $("#_034_mf32b_currency").attr("disabled", true);
      $("#_035_mf32b_amount").attr("disabled", true);
      $("#_036_mf32k_daysmonth").attr("disabled", false);
      $("#_037_mf32k_numberofdaysmonth").attr("disabled", false);
      $("#_038_mf32k_code").attr("disabled", false);
      $("#_039_mf32k_currency").attr("disabled", false);
      $("#_040_mf32k_amount").attr("disabled", false);
    } else {
      $("#div_mf32a").hide();
      $("#div_mf32b").hide();
      $("#div_mf32k").hide();
      $("#_031_mf32a_date").attr("disabled", true);
      $("#_032_mf32a_currency").attr("disabled", true);
      $("#_033_mf32a_amount").attr("disabled", true);
      $("#_034_mf32b_currency").attr("disabled", true);
      $("#_035_mf32b_amount").attr("disabled", true);
      $("#_036_mf32k_daysmonth").attr("disabled", true);
      $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
      $("#_038_mf32k_code").attr("disabled", true);
      $("#_039_mf32k_currency").attr("disabled", true);
      $("#_040_mf32k_amount").attr("disabled", true);
    }
  });

  $("#div_mf33a_a").hide();
  $("#_041_mf33a_a_date").attr("disabled", true);
  $("#_042_mf33a_a_currency").attr("disabled", true);
  $("#_043_mf33a_a_amount").attr("disabled", true);
  $("#type_mf33a_a_proceeds_remitted").change(function () {
    if ($("#type_mf33a_a_proceeds_remitted").val() == "a") {
      $("#div_mf33a_a").show();
      $("#_041_mf33a_a_date").attr("disabled", false);
      $("#_042_mf33a_a_currency").attr("disabled", false);
      $("#_043_mf33a_a_amount").attr("disabled", false);
    } else {
      $("#div_mf33a_a").hide();
      $("#_041_mf33a_a_date").attr("disabled", true);
      $("#_042_mf33a_a_currency").attr("disabled", true);
      $("#_043_mf33a_a_amount").attr("disabled", true);
    }
  });

  //of52//
  $("#div_of52a").hide();
  $("#div_of52d").hide();
  $("#_051_of52a_party_identifier").attr("disabled", true);
  $("#_052_of52a_identifier_code").attr("disabled", true);
  $("#_053_of52d_party_identifier").attr("disabled", true);
  $("#_054_of52d_name_address").attr("disabled", true);
  $("#type_of52_ordering_bank").change(function () {
    if ($("#type_of52_ordering_bank").val() == "a") {
      $("#div_of52a").show();
      $("#div_of52d").hide();
      $("#_051_of52a_party_identifier").attr("disabled", false);
      $("#_052_of52a_identifier_code").attr("disabled", false);
      $("#_053_of52d_party_identifier").attr("disabled", true);
      $("#_054_of52d_name_address").attr("disabled", true);
    } else if ($("#type_of52_ordering_bank").val() == "d") {
      $("#div_of52a").hide();
      $("#div_of52d").show();
      $("#_051_of52a_party_identifier").attr("disabled", true);
      $("#_052_of52a_identifier_code").attr("disabled", true);
      $("#_053_of52d_party_identifier").attr("disabled", false);
      $("#_054_of52d_name_address").attr("disabled", false);
    } else {
      $("#div_of52a").hide();
      $("#div_of52d").hide();
      $("#_051_of52a_party_identifier").attr("disabled", true);
      $("#_052_of52a_identifier_code").attr("disabled", true);
      $("#_053_of52d_party_identifier").attr("disabled", true);
      $("#_054_of52d_name_address").attr("disabled", true);
    }
  });

  //of57//
  $("#div_of57a").hide();
  $("#div_of57d").hide();
  $("#_081_of57a_party_identifier").attr("disabled", true);
  $("#_082_of57a_identifier_code").attr("disabled", true);
  $("#_083_of57d_party_identifier").attr("disabled", true);
  $("#_084_of57d_name_address").attr("disabled", true);
  $("#type_of57_account_with_bank").change(function () {
    if ($("#type_of57_account_with_bank").val() == "a") {
      $("#div_of57a").show();
      $("#div_of57d").hide();
      $("#_081_of57a_party_identifier").attr("disabled", false);
      $("#_082_of57a_identifier_code").attr("disabled", false);
      $("#_083_of57d_party_identifier").attr("disabled", true);
      $("#_084_of57d_name_address").attr("disabled", true);
    } else if ($("#type_of57_account_with_bank").val() == "d") {
      $("#div_of57a").hide();
      $("#div_of57d").show();
      $("#_081_of57a_party_identifier").attr("disabled", true);
      $("#_082_of57a_identifier_code").attr("disabled", true);
      $("#_083_of57d_party_identifier").attr("disabled", false);
      $("#_084_of57d_name_address").attr("disabled", false);
    } else {
      $("#div_of57a").hide();
      $("#div_of57d").hide();
      $("#_081_of57a_party_identifier").attr("disabled", true);
      $("#_082_of57a_identifier_code").attr("disabled", true);
      $("#_083_of57d_party_identifier").attr("disabled", true);
      $("#_084_of57d_name_address").attr("disabled", true);
    }
  });

  //of53_a_b_d
  $("#div_of53a").hide();
  $("#div_of53b").hide();
  $("#div_of53d").hide();
  $("#_061_of53a_party_identifier").attr("disabled", true);
  $("#_062_of53a_Identifier_code").attr("disabled", true);
  $("#_063_of53b_party_identifier").attr("disabled", true);
  $("#_064_of53b_location").attr("disabled", true);
  $("#_065_of53d_party_identifier").attr("disabled", true);
  $("#_066_of53d_name_and_address").attr("disabled", true);
  $("#type_of53_senders_correspondent").change(function () {
    if ($("#type_of53_senders_correspondent").val() == "a") {
      $("#div_of53a").show();
      $("#div_of53b").hide();
      $("#div_of53d").hide();
      $("#_061_of53a_party_identifier").attr("disabled", false);
      $("#_062_of53a_Identifier_code").attr("disabled", false);
      $("#_063_of53b_party_identifier").attr("disabled", true);
      $("#_064_of53b_location").attr("disabled", true);
      $("#_065_of53d_party_identifier").attr("disabled", true);
      $("#_066_of53d_name_address").attr("disabled", true);
    } else if ($("#type_of53_senders_correspondent").val() == "b") {
      $("#div_of53a").hide();
      $("#div_of53b").show();
      $("#div_of53d").hide();
      $("#_061_of53a_party_identifier").attr("disabled", true);
      $("#_062_of53a_Identifier_code").attr("disabled", true);
      $("#_063_of53b_party_identifier").attr("disabled", false);
      $("#_064_of53b_location").attr("disabled", false);
      $("#_065_of53d_party_identifier").attr("disabled", true);
      $("#_066_of53d_name_address").attr("disabled", true);
    } else if ($("#type_of53_senders_correspondent").val() == "d") {
      $("#div_of53a").hide();
      $("#div_of53b").hide();
      $("#div_of53d").show();
      $("#_061_of53a_party_identifier").attr("disabled", true);
      $("#_062_of53a_Identifier_code").attr("disabled", true);
      $("#_063_of53b_party_identifier").attr("disabled", true);
      $("#_064_of53b_location").attr("disabled", true);
      $("#_065_of53d_party_identifier").attr("disabled", false);
      $("#_066_of53d_name_address").attr("disabled", false);
    } else {
      $("#div_of53a").hide();
      $("#div_of53b").hide();
      $("#div_of53d").hide();
      $("#_061_of53a_party_identifier").attr("disabled", true);
      $("#_062_of53a_Identifier_code").attr("disabled", true);
      $("#_063_of53b_party_identifier").attr("disabled", true);
      $("#_064_of53b_location").attr("disabled", true);
      $("#_065_of53d_party_identifier").attr("disabled", true);
      $("#_066_of53d_name_address").attr("disabled", true);
    }
  });

  //of54_a_b_d
  $("#div_of54a").hide();
  $("#div_of54b").hide();
  $("#div_of54d").hide();
  $("#_071_of54a_party_identifier").attr("disabled", true);
  $("#_072_of54a_Identifier_code").attr("disabled", true);
  $("#_073_of54b_party_identifier").attr("disabled", true);
  $("#_074_of54b_location").attr("disabled", true);
  $("#_075_of54d_party_identifier").attr("disabled", true);
  $("#_076_of54d_name_address").attr("disabled", true);
  $("#type_of54_receiver_correspondent").change(function () {
    if ($("#type_of54_receiver_correspondent").val() == "a") {
      $("#div_of54a").show();
      $("#div_of54b").hide();
      $("#div_of54d").hide();
      $("#_071_of54a_party_identifier").attr("disabled", false);
      $("#_072_of54a_Identifier_code").attr("disabled", false);
      $("#_073_of54b_party_identifier").attr("disabled", true);
      $("#_074_of54b_location").attr("disabled", true);
      $("#_075_of54d_party_identifier").attr("disabled", true);
      $("#_076_of54d_name_address").attr("disabled", true);
    } else if ($("#type_of54_receiver_correspondent").val() == "b") {
      $("#div_of54a").hide();
      $("#div_of54b").show();
      $("#div_of54d").hide();
      $("#_071_of54a_party_identifier").attr("disabled", true);
      $("#_072_of54a_Identifier_code").attr("disabled", true);
      $("#_073_of54b_party_identifier").attr("disabled", false);
      $("#_074_of54b_location").attr("disabled", false);
      $("#_075_of54d_party_identifier").attr("disabled", true);
      $("#_076_of54d_name_address").attr("disabled", true);
    } else if ($("#type_of54_receiver_correspondent").val() == "d") {
      $("#div_of54a").hide();
      $("#div_of54b").hide();
      $("#div_of54d").show();
      $("#_071_of54a_party_identifier").attr("disabled", true);
      $("#_072_of54a_Identifier_code").attr("disabled", true);
      $("#_073_of54b_party_identifier").attr("disabled", true);
      $("#_074_of54b_location").attr("disabled", true);
      $("#_075_of54d_party_identifier").attr("disabled", false);
      $("#_076_of54d_name_address").attr("disabled", false);
    } else {
      $("#div_of54a").hide();
      $("#div_of54b").hide();
      $("#div_of54d").hide();
      $("#_071_of54a_party_identifier").attr("disabled", true);
      $("#_072_of54a_Identifier_code").attr("disabled", true);
      $("#_073_of54b_party_identifier").attr("disabled", true);
      $("#_074_of54b_location").attr("disabled", true);
      $("#_075_of54d_party_identifier").attr("disabled", true);
      $("#_076_of54d_name_address").attr("disabled", true);
    }
  });
  //of57_a_b_c_d
  $("#div_of58a").hide();
  $("#div_of58b").hide();
  $("#div_of58d").hide();
  $("#_091_of58a_party_identifier").attr("disabled", true);
  $("#_092_of58a_Identifier_code").attr("disabled", true);
  $("#_093_of58b_party_identifier").attr("disabled", true);
  $("#_094_of58b_location").attr("disabled", true);
  $("#_095_of58d_party_identifier").attr("disabled", true);
  $("#_096_of58d_name_and_address").attr("disabled", true);

  $("#type_of58_beneficiary_bank").change(function () {
    if ($("#type_of58_beneficiary_bank").val() == "a") {
      $("#div_of58a").show();
      $("#div_of58b").hide();
      $("#div_of58d").hide();
      $("#_091_of58a_party_identifier").attr("disabled", false);
      $("#_092_of58a_Identifier_code").attr("disabled", false);
      $("#_093_of58b_party_identifier").attr("disabled", true);
      $("#_094_of58b_location").attr("disabled", true);
      $("#_096_of58d_name_and_address").attr("disabled", true);
    } else if ($("#type_of58_beneficiary_bank").val() == "b") {
      $("#div_of58a").hide();
      $("#div_of58b").show();
      $("#div_of58d").hide();
      $("#_091_of58a_party_identifier").attr("disabled", true);
      $("#_092_of58a_Identifier_code").attr("disabled", true);
      $("#_093_of58b_party_identifier").attr("disabled", false);
      $("#_094_of58b_location").attr("disabled", false);
      $("#_095_of58d_party_identifier").attr("disabled", true);
      $("#_096_of58d_name_and_address").attr("disabled", true);
    } else if ($("#type_of58_beneficiary_bank").val() == "d") {
      $("#div_of58a").hide();
      $("#div_of58b").hide();
      $("#div_of58d").show();
      $("#_091_of58a_party_identifier").attr("disabled", true);
      $("#_092_of58a_Identifier_code").attr("disabled", true);
      $("#_093_of58b_party_identifier").attr("disabled", true);
      $("#_094_of58b_location").attr("disabled", true);
      $("#_095_of58d_party_identifier").attr("disabled", false);
      $("#_096_of58d_name_and_address").attr("disabled", false);
    } else {
      $("#div_of58a").hide();
      $("#div_of58b").hide();
      $("#div_of58d").hide();
      $("#_091_of58a_party_identifier").attr("disabled", true);
      $("#_092_of58a_Identifier_code").attr("disabled", true);
      $("#_093_of58b_party_identifier").attr("disabled", true);
      $("#_094_of58b_location").attr("disabled", true);
      $("#_095_of58d_party_identifier").attr("disabled", true);
      $("#_096_of58d_name_and_address").attr("disabled", true);
    }
  });

  //        //of71f
  //        $("#div_of71f_sender_charges").hide();
  //        $("#_212_of71f_currency").attr("disabled", true);
  //        $("#_213_of71f_amount").attr("disabled", true);
  //        $("#_210_of71f_sender_charges_add").click(function() {
  //            $("#div_of71f_sender_charges").show();
  //            $("#_212_of71f_currency").attr("disabled", false);
  //            $("#_213_of71f_amount").attr("disabled", false);
  //        });
  //        $("#_211_of71f_sender_charges_remove").click(function() {
  //            $("#div_of71f_sender_charges").hide();
  //            $("#_212_of71f_currency").attr("disabled", true);
  //            $("#_213_of71f_amount").attr("disabled", true);
  //        });
});


//rule view

$(document).ready(function () {
  //of13c
  if ($("#_022_of13c_code").val() != "") {
    $("#div_of13c_").show();
    $("#_022_of13c_code").attr("disabled", false);
  } else {
    $("#div_of13c_").hide();
    $("#_022_of13c_code").attr("disabled", true);
  }

  //of23e
  if ($("#_042_of23e_code").val() != "") {
    $("#div_of23e_").show();
    $("#_042_of23e_code").attr("disabled", false);
  } else {
    $("#div_of23e_").hide();
    $("#_042_of23e_code").attr("disabled", true);
  }

  //mf32 a b k
  if (
    $("#_031_mf32a_date").val() != "" ||
    $("#_032_mf32a_currency").val() != "" ||
    $("#_033_mf32a_amount").val() != ""
  ) {
    $("#type_mf32_amount_collected").val("a").attr("selected", true);
    $("#div_mf32a").show();
    $("#div_mf32b").hide();
    $("#div_mf32k").hide();
    $("#_031_mf32a_date").attr("disabled", false);
    $("#_032_mf32a_currency").attr("disabled", false);
    $("#_033_mf32a_amount").attr("disabled", false);
    $("#_034_mf32b_currency").attr("disabled", true);
    $("#_035_mf32b_amount").attr("disabled", true);
    $("#_036_mf32k_daysmonth").attr("disabled", true);
    $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
    $("#_038_mf32k_code").attr("disabled", true);
    $("#_039_mf32k_currency").attr("disabled", true);
    $("#_040_mf32k_amount").attr("disabled", true);
  } else if (
    $("#_034_mf32b_currency").val() != "" ||
    $("#_035_mf32b_amount").val() != ""
  ) {
    $("#type_mf32_amount_collected").val("b").attr("selected", true);
    $("#div_mf32a").hide();
    $("#div_mf32b").show();
    $("#div_mf32k").hide();
    $("#_031_mf32a_date").attr("disabled", true);
    $("#_032_mf32a_currency").attr("disabled", true);
    $("#_033_mf32a_amount").attr("disabled", true);
    $("#_034_mf32b_currency").attr("disabled", false);
    $("#_035_mf32b_amount").attr("disabled", false);
    $("#_036_mf32k_daysmonth").attr("disabled", true);
    $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
    $("#_038_mf32k_code").attr("disabled", true);
    $("#_039_mf32k_currency").attr("disabled", true);
    $("#_040_mf32k_amount").attr("disabled", true);
  } else if (
    $("#_036_mf32k_daysmonth").val() != "" ||
    $("#_037_mf32k_numberofdaysmonth").val() != "" ||
    $("#_038_mf32k_code").val() != "" ||
    $("#_039_mf32k_currency").val() != "" ||
    $("#_040_mf32k_amount").val() != ""
  ) {
    $("#type_mf32_amount_collected").val("k").attr("selected", true);
    $("#div_mf32a").hide();
    $("#div_mf32b").hide();
    $("#div_mf32k").show();
    $("#_031_mf32a_date").attr("disabled", true);
    $("#_032_mf32a_currency").attr("disabled", true);
    $("#_033_mf32a_amount").attr("disabled", true);
    $("#_034_mf32b_currency").attr("disabled", true);
    $("#_035_mf32b_amount").attr("disabled", true);
    $("#_036_mf32k_daysmonth").attr("disabled", false);
    $("#_037_mf32k_numberofdaysmonth").attr("disabled", false);
    $("#_038_mf32k_code").attr("disabled", false);
    $("#_039_mf32k_currency").attr("disabled", false);
    $("#_040_mf32k_amount").attr("disabled", false);
  } else {
    $("#div_mf32a").hide();
    $("#div_mf32b").hide();
    $("#div_mf32k").hide();
    $("#_031_mf32a_date").attr("disabled", true);
    $("#_032_mf32a_currency").attr("disabled", true);
    $("#_033_mf32a_amount").attr("disabled", true);
    $("#_034_mf32b_currency").attr("disabled", true);
    $("#_035_mf32b_amount").attr("disabled", true);
    $("#_036_mf32k_daysmonth").attr("disabled", true);
    $("#_037_mf32k_numberofdaysmonth").attr("disabled", true);
    $("#_038_mf32k_code").attr("disabled", true);
    $("#_039_mf32k_currency").attr("disabled", true);
    $("#_040_mf32k_amount").attr("disabled", true);
  }

  //mf33A//
  if (
    $("#_041_mf33a_a_date").val() != "" ||
    $("#_042_mf33a_a_currency").val() != "" ||
    $("#_043_mf33a_a_amount").val() != ""
  ) {
    $("#type_mf33a_a_proceeds_remitted").val("a").attr("selected", true);
    $("#div_mf33a_a").show();
    $("#_041_mf33a_a_date").attr("disabled", false);
    $("#_042_mf33a_a_currency").attr("disabled", false);
    $("#_043_mf33a_a_amount").attr("disabled", false);
  } else {
    $("#div_mf33a_a").hide();
    $("#_041_mf33a_a_date").attr("disabled", true);
    $("#_042_mf33a_a_currency").attr("disabled", true);
    $("#_043_mf33a_a_amount").attr("disabled", true);
  }

  if (
    $("#_051_of52a_party_identifier").val() != "" ||
    $("#_052_of52a_identifier_code").val() != ""
  ) {
    $("#type_of52_ordering_bank").val("a").attr("selected", true);
    $("#div_of52a").show();
    $("#div_of52d").hide();
    $("#_051_of52a_party_identifier").attr("disabled", false);
    $("#_052_of52a_identifier_code").attr("disabled", false);
    $("#_053_of52d_party_identifier").attr("disabled", true);
    $("#_054_of52d_name_address").attr("disabled", true);
  } else if (
    $("#_053_of52d_party_identifier").val() != "" ||
    $("#_054_of52d_name_address").val() != ""
  ) {
    $("#type_of52_ordering_bank").val("d").attr("selected", true);
    $("#div_of52a").hide();
    $("#div_of52d").show();
    $("#_051_of52a_party_identifier").attr("disabled", true);
    $("#_052_of52a_identifier_code").attr("disabled", true);
    $("#_053_of52d_party_identifier").attr("disabled", false);
    $("#_054_of52d_name_address").attr("disabled", false);
  } else {
    $("#div_of52a").hide();
    $("#div_of52d").hide();
    $("#_051_of52a_party_identifier").attr("disabled", true);
    $("#_052_of52a_identifier_code").attr("disabled", true);
    $("#_053_of52d_party_identifier").attr("disabled", true);
    $("#_054_of52d_name_address").attr("disabled", true);
  }

  //of53_a_b_d
  if (
    $("#_061_of53a_party_identifier").val() != "" ||
    $("#_062_of53a_Identifier_code").val() != ""
  ) {
    $("#type_of53_senders_correspondent").val("a").attr("selected", true);
    $("#div_of53a").show();
    $("#div_of53b").hide();
    $("#div_of53d").hide();
    $("#_061_of53a_party_identifier").attr("disabled", false);
    $("#_062_of53a_Identifier_code").attr("disabled", false);
    $("#_063_of53b_party_identifier").attr("disabled", true);
    $("#_064_of53b_location").attr("disabled", true);
    $("#_065_of53d_party_identifier").attr("disabled", true);
    $("#_066_of53d_name_address").attr("disabled", true);
  } else if (
    $("#_063_of53b_party_identifier").val() != "" ||
    $("#_064_of53b_location").val() != ""
  ) {
    $("#type_of53_senders_correspondent").val("b").attr("selected", true);
    $("#div_of53a").hide();
    $("#div_of53b").show();
    $("#div_of53d").hide();
    $("#_061_of53a_party_identifier").attr("disabled", true);
    $("#_062_of53a_Identifier_code").attr("disabled", true);
    $("#_063_of53b_party_identifier").attr("disabled", false);
    $("#_064_of53b_location").attr("disabled", false);
    $("#_065_of53d_party_identifier").attr("disabled", true);
    $("#_066_of53d_name_address").attr("disabled", true);
  } else if (
    $("#_065_of53d_party_identifier").val() != "" ||
    $("#_066_of53d_name_address").val() != ""
  ) {
    $("#type_of53_senders_correspondent").val("d").attr("selected", true);
    $("#div_of53a").hide();
    $("#div_of53b").hide();
    $("#div_of53d").show();
    $("#_061_of53a_party_identifier").attr("disabled", true);
    $("#_062_of53a_Identifier_code").attr("disabled", true);
    $("#_063_of53b_party_identifier").attr("disabled", true);
    $("#_064_of53b_location").attr("disabled", true);
    $("#_065_of53d_party_identifier").attr("disabled", false);
    $("#_066_of53d_name_address").attr("disabled", false);
  } else {
    $("#div_of53a").hide();
    $("#div_of53b").hide();
    $("#div_of53d").hide();
    $("#_061_of53a_party_identifier").attr("disabled", true);
    $("#_062_of53a_Identifier_code").attr("disabled", true);
    $("#_063_of53b_party_identifier").attr("disabled", true);
    $("#_064_of53b_location").attr("disabled", true);
    $("#_065_of53d_party_identifier").attr("disabled", false);
    $("#_066_of53d_name_address").attr("disabled", false);
  }

  if (
    $("#_071_of54a_party_identifier").val() != "" ||
    $("#_072_of54a_Identifier_code").val() != ""
  ) {
    $("#type_of54_receiver_correspondent").val("a").attr("selected", true);
    $("#div_of54a").show();
    $("#div_of54b").hide();
    $("#div_of54d").hide();
    $("#_071_of54a_party_identifier").attr("disabled", false);
    $("#_072_of54a_Identifier_code").attr("disabled", false);
    $("#_073_of54b_party_identifier").attr("disabled", true);
    $("#_074_of54b_location").attr("disabled", true);
    $("#_075_of54d_party_identifier").attr("disabled", true);
    $("#_076_of54d_name_address").attr("disabled", true);
  } else if (
    $("#_073_of54b_party_identifier").val() != "" ||
    $("#_074_of54b_location").val() != ""
  ) {
    $("#type_of54_receiver_correspondent").val("b").attr("selected", true);
    $("#div_of54a").hide();
    $("#div_of54b").show();
    $("#div_of54d").hide();
    $("#_071_of54a_party_identifier").attr("disabled", true);
    $("#_072_of54a_Identifier_code").attr("disabled", true);
    $("#_073_of54b_party_identifier").attr("disabled", false);
    $("#_074_of54b_location").attr("disabled", false);
    $("#_075_of54d_party_identifier").attr("disabled", true);
    $("#_076_of54d_name_address").attr("disabled", true);
  } else if (
    $("#_075_of54d_party_identifier").val() != "" ||
    $("#_076_of54d_name_address").val() != ""
  ) {
    $("#type_of54_receiver_correspondent").val("d").attr("selected", true);
    $("#div_of54a").hide();
    $("#div_of54b").hide();
    $("#div_of54d").show();
    $("#_071_of54a_party_identifier").attr("disabled", false);
    $("#_072_of54a_Identifier_code").attr("disabled", false);
    $("#_073_of54b_party_identifier").attr("disabled", true);
    $("#_074_of54b_location").attr("disabled", true);
    $("#_075_of54d_party_identifier").attr("disabled", true);
    $("#_076_of54d_name_address").attr("disabled", true);
  } else {
    $("#div_of54a").hide();
    $("#div_of54b").hide();
    $("#div_of54d").hide();
    $("#_071_of54a_party_identifier").attr("disabled", false);
    $("#_072_of54a_Identifier_code").attr("disabled", false);
    $("#_073_of54b_party_identifier").attr("disabled", true);
    $("#_074_of54b_location").attr("disabled", true);
    $("#_075_of54d_party_identifier").attr("disabled", true);
    $("#_076_of54d_name_address").attr("disabled", true);
  }

  //of52//
  if (
    $("#_081_of57a_party_identifier").val() != "" ||
    $("#_082_of57a_identifier_code").val() != ""
  ) {
    $("#type_of57_account_with_bank").val("a").attr("selected", true);
    $("#div_of57a").show();
    $("#div_of57d").hide();
    $("#_081_of57a_party_identifier").attr("disabled", false);
    $("#_082_of57a_identifier_code").attr("disabled", false);
    $("#_083_of57d_party_identifier").attr("disabled", true);
    $("#_084_of57d_name_address").attr("disabled", true);
  } else if (
    $("#_083_of57d_party_identifier").val() != "" ||
    $("#_084_of57d_name_address").val() != ""
  ) {
    $("#type_of57_account_with_bank").val("d").attr("selected", true);
    $("#div_of57a").hide();
    $("#div_of57d").show();
    $("#_081_of57a_party_identifier").attr("disabled", true);
    $("#_082_of57a_identifier_code").attr("disabled", true);
    $("#_083_of57d_party_identifier").attr("disabled", false);
    $("#_084_of57d_name_address").attr("disabled", false);
  } else {
    $("#div_of57a").hide();
    $("#div_of57d").hide();
    $("#_081_of57a_party_identifier").attr("disabled", true);
    $("#_082_of57a_identifier_code").attr("disabled", true);
    $("#_083_of57d_party_identifier").attr("disabled", false);
    $("#_084_of57d_name_address").attr("disabled", false);
  }

  //of58//
  if (
    $("#_091_of58a_party_identifier").val() != "" ||
    $("#_092_of58a_Identifier_code").val() != ""
  ) {
    $("#type_of58_beneficiary_bank").val("a").attr("selected", true);
    $("#div_of58a").show();
    $("#div_of58b").hide();
    $("#div_of58d").hide();
    $("#_091_of58a_party_identifier").attr("disabled", false);
    $("#_092_of58a_Identifier_code").attr("disabled", false);
    $("#_093_of58b_party_identifier").attr("disabled", true);
    $("#_094_of58b_location").attr("disabled", true);
    $("#_095_of58d_party_identifier").attr("disabled", true);
    $("#_096_of58d_name_and_address").attr("disabled", true);
  } else if (
    $("#_093_of58b_party_identifier").val() != "" ||
    $("#_094_of58b_location").val() != ""
  ) {
    $("#type_of58_beneficiary_bank").val("b").attr("selected", true);
    $("#div_of58a").hide();
    $("#div_of58b").show();
    $("#div_of58d").hide();
    $("#_091_of58a_party_identifier").attr("disabled", false);
    $("#_092_of58a_Identifier_code").attr("disabled", false);
    $("#_093_of58b_party_identifier").attr("disabled", false);
    $("#_094_of58b_location").attr("disabled", false);
    $("#_095_of58d_party_identifier").attr("disabled", true);
    $("#_096_of58d_name_and_address").attr("disabled", true);
  } else if (
    $("#_075_of54d_party_identifier").val() != "" ||
    $("#_076_of54d_name_address").val() != ""
  ) {
    $("#type_of58_beneficiary_bank").val("d").attr("selected", true);
    $("#div_of58a").hide();
    $("#div_of58b").hide();
    $("#div_of58d").show();
    $("#_091_of58a_party_identifier").attr("disabled", false);
    $("#_092_of58a_Identifier_code").attr("disabled", false);
    $("#_093_of58b_party_identifier").attr("disabled", true);
    $("#_094_of58b_location").attr("disabled", true);
    $("#_095_of58d_party_identifier").attr("disabled", false);
    $("#_096_of58d_name_and_address").attr("disabled", false);
  } else {
    $("#div_of58a").hide();
    $("#div_of58b").hide();
    $("#div_of58d").hide();
    $("#_091_of58a_party_identifier").attr("disabled", false);
    $("#_092_of58a_Identifier_code").attr("disabled", false);
    $("#_093_of58b_party_identifier").attr("disabled", true);
    $("#_094_of58b_location").attr("disabled", true);
    $("#_095_of58d_party_identifier").attr("disabled", true);
    $("#_096_of58d_name_and_address").attr("disabled", true);
  }

  //of57_a_b_c_d
  if (
    $("#_170_of57a_party_identifier").val() != "" ||
    $("#_171_of57a_identifier_code").val() != ""
  ) {
    $("#type_of57_").val("a").attr("selected", true);
    $("#div_of57a_").show();
    $("#div_of57b_").hide();
    $("#div_of57c_").hide();
    $("#div_of57d_").hide();
    $("#_170_of57a_party_identifier").attr("disabled", false);
    $("#_171_of57a_identifier_code").attr("disabled", false);
    $("#_173_of57b_party_identifier").attr("disabled", true);
    $("#_174_of57b_location").attr("disabled", true);
    $("#_175_of57c_party_identifier").attr("disabled", true);
    $("#_176_of57d_party_identifier").attr("disabled", true);
    $("#_177_of57d_name_address").attr("disabled", true);
  } else if (
    $("#_173_of57b_party_identifier").val() != "" ||
    $("#_174_of57b_location").val() != ""
  ) {
    $("#type_of57_").val("b").attr("selected", true);
    $("#div_of57a_").hide();
    $("#div_of57b_").show();
    $("#div_of57c_").hide();
    $("#div_of57d_").hide();
    $("#_170_of57a_party_identifier").attr("disabled", true);
    $("#_171_of57a_identifier_code").attr("disabled", true);
    $("#_173_of57b_party_identifier").attr("disabled", false);
    $("#_174_of57b_location").attr("disabled", false);
    $("#_175_of57c_party_identifier").attr("disabled", true);
    $("#_176_of57d_party_identifier").attr("disabled", true);
    $("#_177_of57d_name_address").attr("disabled", true);
  } else if ($("#_175_of57c_party_identifier").val() != "") {
    $("#type_of57_").val("c").attr("selected", true);
    $("#div_of57a_").hide();
    $("#div_of57b_").hide();
    $("#div_of57c_").show();
    $("#div_of57d_").hide();
    $("#_170_of57a_party_identifier").attr("disabled", true);
    $("#_171_of57a_identifier_code").attr("disabled", true);
    $("#_173_of57b_party_identifier").attr("disabled", true);
    $("#_174_of57b_location").attr("disabled", true);
    $("#_175_of57c_party_identifier").attr("disabled", false);
    $("#_176_of57d_party_identifier").attr("disabled", true);
    $("#_177_of57d_name_address").attr("disabled", true);
  } else if (
    $("#_176_of57d_party_identifier").val() != "" ||
    $("#_177_of57d_name_address").val() != ""
  ) {
    $("#type_of57_").val("d").attr("selected", true);
    $("#div_of57a_").hide();
    $("#div_of57b_").hide();
    $("#div_of57c_").hide();
    $("#div_of57d_").show();
    $("#_170_of57a_party_identifier").attr("disabled", true);
    $("#_171_of57a_identifier_code").attr("disabled", true);
    $("#_173_of57b_party_identifier").attr("disabled", true);
    $("#_174_of57b_location").attr("disabled", true);
    $("#_175_of57c_party_identifier").attr("disabled", true);
    $("#_176_of57d_party_identifier").attr("disabled", false);
    $("#_177_of57d_name_address").attr("disabled", false);
  } else {
    $("#div_of57a_").hide();
    $("#div_of57b_").hide();
    $("#div_of57c_").hide();
    $("#div_of57d_").hide();
    $("#_170_of57a_party_identifier").attr("disabled", true);
    $("#_171_of57a_identifier_code").attr("disabled", true);
    $("#_173_of57b_party_identifier").attr("disabled", true);
    $("#_174_of57b_location").attr("disabled", true);
    $("#_175_of57c_party_identifier").attr("disabled", true);
    $("#_176_of57d_party_identifier").attr("disabled", true);
    $("#_177_of57d_name_address").attr("disabled", true);
  }

  //mf59_59a
  if (
    $("#_180_mf59_account").val() != "" ||
    $("#_181_mf59_name_address").val() != ""
  ) {
    $("#type_of59_59a_").val("59").attr("selected", true);
    $("#div_mf59_").show();
    $("#div_mf59a_").hide();
    $("#_180_mf59_account").attr("disabled", false);
    $("#_181_mf59_name_address").attr("disabled", false);
    $("#_182_mf59a_account").attr("disabled", true);
    $("#_183_mf59a_identifier_code").attr("disabled", true);
  } else if (
    $("#_182_mf59a_account").val() != "" ||
    $("#_183_mf59a_identifier_code").val() != ""
  ) {
    $("#type_of59_59a_").val("59a").attr("selected", true);
    $("#div_mf59_").hide();
    $("#div_mf59a_").show();
    $("#_180_mf59_account").attr("disabled", true);
    $("#_181_mf59_name_address").attr("disabled", true);
    $("#_182_mf59a_account").attr("disabled", false);
    $("#_183_mf59a_identifier_code").attr("disabled", false);
  } else {
    $("#div_mf59_").hide();
    $("#div_mf59a_").hide();
    $("#_180_mf59_account").attr("disabled", true);
    $("#_181_mf59_name_address").attr("disabled", true);
    $("#_182_mf59a_account").attr("disabled", true);
    $("#_183_mf59a_identifier_code").attr("disabled", true);
  }
});
