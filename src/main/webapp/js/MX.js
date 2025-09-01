flatpickr(".datetime-local", {
    enableTime: true,
    enableSeconds: true,
    dateFormat: "Y-m-d\TH:i:S",
    time_24hr: true,
    minuteIncrement: 1,
});
flatpickr(".date", {
    dateFormat: "Y-m-d",
    enableTime: false
});
flatpickr(".time", {
    enableTime: true,
    enableSeconds: true,
    dateFormat: "H:i:S",
    time_24hr: true,
    minuteIncrement: 1,
    noCalendar: true,
    utc: true
});
function generateUUID() {
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
        return v.toString(16);
    });
}
function generateuetr() {
    const uuid = generateUUID();
    const inputField = document.getElementById("UETR");
    inputField.value = uuid;
    inputField.setAttribute("value", uuid);
}

function textonly(e) {
    var code;
    if (!e)
        var e = window.event;
    if (e.keyCode)
        code = e.keyCode;
    else if (e.which)
        code = e.which;
    var character = String.fromCharCode(code);

    var AllowRegex = /^[\ba-zA-Z\s-]$/;
    if (AllowRegex.test(character))
        return true;
    return false;
}

document.addEventListener("DOMContentLoaded", function () {
    const statusInput = document.getElementById("status"); // Ambil elemen status
    const form = document.getElementById("form1"); // Ambil elemen form

    if ((statusInput && statusInput.value === "INC" && form) || (statusInput && statusInput.value === "VER" && form) || (statusInput && statusInput.value === "AUTH" && form) || (statusInput && statusInput.value === "CVT-VER" && form) || (statusInput && statusInput.value === "WAITING-AML" && form) || (statusInput && statusInput.value === "REJECT" && form) || (statusInput && statusInput.value === "RESEND" && form)) {
        const allInputs = form.elements; // Ambil semua elemen dalam form sekali saja
        for (let input of allInputs) {
            if (input.tagName === "SELECT" || input.tagName === "BUTTON") {
                input.disabled = true;
            } else {
                input.readOnly = true;
            }
        }
    }
});

function formatBICFI(input) {
    input.value = input.value.toUpperCase();
    let value = input.value.trim();
    if (value.length === 12) {
        const part1 = value.substring(0, 8);
        const part2 = value.substring(9, 12);
        const newValue = part1 + part2;
        newValue.toUpperCase();
        input.value = newValue;
        console.log("BICFI setelah diproses:", newValue);
    } else if (value.length === 11) {
        input.value.toUpperCase();
    } else if (value.length < 11) {
        alert('BICFI must be 12 characters (example: BDINIDJAXXXX)');
    }
}

function validateAmount(input) {
    let value = input.value.trim().replace(',', '.');
    if (value && parseFloat(value) === 0) {
        alert('Amount must not be Zero (0)');
    }
}
function copyToMsgId() {
    const rtrid = document.getElementById('rtrid');
    const msgid = document.getElementById('msgid');
    msgid.value = rtrid.value;
}