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
    rules: mtn99_content.rules,
    messages: mtn99_content.messages,
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

  let today = new Date(Date.now());

  let yyyy = String(today.getFullYear()).padStart(4, '0');
  let mm = String(today.getMonth() + 1).padStart(2, '0');
  let dd = String(today.getDate()).padStart(2, '0');

  document.getElementById("_060_mf32a_date").value = yyyy + mm + dd;
  document.getElementById("_062_mf32a_amount").value = "0,0"
});

loadCss("../../css/validate.css");