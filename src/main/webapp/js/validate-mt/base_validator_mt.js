function addContainer(el) {
    let tagName = $(el).data("id");

    let $container = $(`#container_${tagName}`);
    let count = $(`[id*="template_${tagName}"]`).length;
    let maxCount = parseInt($(`#max_occ_${tagName}`).text());

    if ((maxCount !== 0) & (count > maxCount)) {
        alert(`Limit of ${maxCount} fields reached`);
        return;
    }

    let $divClone = $(`#template_${tagName}`).clone();
    $divClone.attr("id", `#template_${tagName}_${count}`);
    $divClone.removeAttr("style");
    $divClone.find("span.label").text(`Count ${count}`);

    $divClone.find(`[id*="${tagName}"]`).each((_, el) => {
        let curId = $(el).attr("id");
        $(el).attr("id", `${curId}_${count + 1}`);
        let curName = $(el).attr("name");
        $(el).attr("name", `${curName}_${count + 1}`);
    });

    // Attach remove button
    $divClone.find("button.remove-btn").click(() => {
        $divClone.remove();
    });

    // Add to container
    $container.append($divClone.get());
}

const selectionBoxToggle = (field, option, isHidden, sequence) => {
    let divId = `${field}${option}_${sequence}`;

    console.log(`Selection Box Toggle ${divId}`);

    if (isHidden) {
        $(`[id*="div_${divId}"]`).hide();
    } else {
        $(`[id*="div_${divId}"]`).show();
    }

    $(`[id*="div_${divId}"] [id*="_${divId}"]`).attr("disabled", isHidden);
};

const checkBoxToggle = () => {
    $("[id*=check_]").each((_, el) => {
        let id = $(el).attr("id");
        id = id.replace("check_", "");

        let divId = `#div_opt_${id}`;
        let checkId = `#check_${id}`;

        $(divId).hide();

        let isInputEmpty = true;
        $(divId)
            .find("textarea")
            .each((_, el) => {
                isInputEmpty = isInputEmpty && $(el).text() === "";
            });

        $(divId)
            .find("input")
            .each((_, el) => {
                isInputEmpty = isInputEmpty && $(el).val() === "";
            });

        let JQDivId = `[id*="_${id}_"]`;

        $(checkId).attr("checked", !isInputEmpty);
        $(divId)
            .find(`input${JQDivId},textarea${JQDivId}`)
            .attr("disabled", isInputEmpty);
        if (!isInputEmpty) {
            $(divId).show();
        } else {
            $(divId).hide();
        }

        $(el).click(function () {
            if ($(this).is(":checked")) {
                $(divId).show();
                $(divId)
                    .find(`input${JQDivId},textarea${JQDivId}`)
                    .attr("disabled", false);
            } else {
                $(divId).hide();
                $(divId)
                    .find(`input${JQDivId},textarea${JQDivId}`)
                    .attr("disabled", true);
            }
        });
    });
};

const cleanupTextarea = () => {
    $("textarea").each(function () {
        $(this).val($.trim($(this).val()));
    });
};

const fieldInputToggle = () => {
    $(".form-row").each((_, el) => {
        let $div = $(el);

        let label = $div.find("span.label_body").text().trim();
        if (label === "") return;
        label = label.toLowerCase();

        let $isSelectDiv = $div.find('select[id*="type_"]');

        if ($isSelectDiv.length > 0) {
            let [key, seq] = $isSelectDiv
                .attr("id")
                .replace("type_", "")
                .split("_");

            let optList = $isSelectDiv
                .find("option")
                .map((_, el) => $(el).val())
                .get();

            optList.forEach((opt) => {
                let isFilled = false;

                $(`input[id*="_${key}${opt}_"]`).each((_, el) => {
                    isFilled = $(el).val() !== "" || isFilled;
                });

                $(`textarea[id*="_${key}${opt}_"]`).each((_, el) => {
                    isFilled = $(el).val() !== "" || isFilled;
                });

                if (isFilled) {
                    $(`select[id*="type_${key}_${seq}"]`)
                        .val(opt)
                        .attr("selected", isFilled);
                }
                selectionBoxToggle(key, opt, !isFilled, seq);
            });

            $(`select[id*="type_${key}_${seq}"]`).change(function () {
                let selectedOpt = $(this).val();
                selectionBoxToggle(key, selectedOpt, false, seq);
                optList.forEach((opt) => {
                    if (selectedOpt !== opt) {
                        selectionBoxToggle(key, opt, true, seq);
                    }
                });
            });
        }

        // Regex
    });
};

$(document).ready(function () {
    let validator = $("#form1").validate({
        ignore: [],
        onkeyup: false, // Nonaktifkan validasi saat mengetik
        onfocusout: false,
        rules: cur_mt_content.rules,
        messages: cur_mt_content.messages,
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
                tableHTML +=
                    '<td style="padding: 5px;">' + locationTab + "</td>";
                tableHTML += '<td style="padding: 5px;">' + inputType + "</td>";
                tableHTML +=
                    '<td style="padding: 5px;">' +
                    errors.message +
                    "</td></tr>";
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
                                $(
                                    "#view2, #view3, #view4, #view5, #view6, #view7, #view8"
                                ).css("display", "none");
                                $("#view1").css("display", "block");
                                $("#tab-view1").addClass("selected");
                                $("#tab-view2")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view3")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view4")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view5")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view6")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view7")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-validate")
                                    .removeClass("selected")
                                    .removeAttr("class");
                            } else if (tabContentGroup == "Body") {
                                $(
                                    "#view1, #view3, #view4, #view5, #view6, #view7, #view8"
                                ).css("display", "none");
                                $("#tab-view1")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view2").addClass("selected");
                                $("#tab-view3")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view4")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view5")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view6")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-view7")
                                    .removeClass("selected")
                                    .removeAttr("class");
                                $("#tab-validate")
                                    .removeClass("selected")
                                    .removeAttr("class");
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

    $.validator.messages.required = function (param, input) {
        let fieldName = $(input).data("label") || input.name || "field";
        return `This ${fieldName} is required!`;
    };

    $.validator.messages.fieldValidator = function (param, input) {
        let swiftFormat = $(input).data("swift") || "";
        let fieldName = input.name || "field";
        return `Format ${fieldName} tidak sesuai..!! (${swiftFormat})`;
    };

    $.validator.messages.required = function (param, input) {
        let fieldName = input.name || "field";
        return `${fieldName} must be filled..!!`;
    };

    checkBoxToggle();
    fieldInputToggle();
});
