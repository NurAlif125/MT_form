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

function numbersonly(e) {
    var charCode = (e.which) ? e.which : event.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}

function amount(e, element) {
    var charCode = (e.which) ? e.which : e.keyCode;

    // Izinkan: angka, titik, backspace, tab, panah, delete, enter
    if (
        (charCode >= 48 && charCode <= 57) || // angka 0–9
        charCode === 46 || // titik .
        charCode === 8 ||  // backspace
        charCode === 9 ||  // tab
        charCode === 37 || // panah kiri
        charCode === 39 || // panah kanan
        charCode === 46 || // delete
        charCode === 13    // enter
    ) {
        var value = element.value;
        var key = String.fromCharCode(charCode);

        // Jika tombol titik ditekan
        if (charCode === 46) {
            // Cegah lebih dari satu titik
            if (value.includes('.')) {
                return false;
            }

            // ❗ Tambahkan validasi total digit
            var totalDigits = value.replace('.', '');
            if (totalDigits.length >= 14) {
                // Sudah 11 digit, tidak boleh tambah titik
                return false;
            }

            return true;
        }

        // Prediksi hasil akhir setelah mengetik
        var newValue =
            value.substring(0, element.selectionStart) +
            key +
            value.substring(element.selectionEnd);

        // Validasi total digits (tanpa titik)
        var totalDigits = newValue.replace('.', '');
        if (totalDigits.length > 14) {
            return false;
        }

        // Validasi fraction digits (setelah titik)
        if (newValue.includes('.')) {
            var parts = newValue.split('.');
            if (parts[1].length > 4) {
                return false;
            }
        }

        return true;
    }

    return false;
}

function xchangerate(e, element) {
    var charCode = (e.which) ? e.which : e.keyCode;

    // Izinkan: angka, titik, backspace, tab, panah, delete, enter
    if (
        (charCode >= 48 && charCode <= 57) || // angka 0–9
        charCode === 46 || // titik .
        charCode === 8 ||  // backspace
        charCode === 9 ||  // tab
        charCode === 37 || // panah kiri
        charCode === 39 || // panah kanan
        charCode === 46 || // delete
        charCode === 13    // enter
    ) {
        var value = element.value;
        var key = String.fromCharCode(charCode);

        // Jika tombol titik ditekan
        if (charCode === 46) {
            // Cegah lebih dari satu titik
            if (value.includes('.')) {
                return false;
            }

            // ❗ Tambahkan validasi total digit
            var totalDigits = value.replace('.', '');
            if (totalDigits.length >= 11) {
                // Sudah 11 digit, tidak boleh tambah titik
                return false;
            }

            return true;
        }

        // Prediksi hasil akhir setelah mengetik
        var newValue =
            value.substring(0, element.selectionStart) +
            key +
            value.substring(element.selectionEnd);

        // Validasi total digits (tanpa titik)
        var totalDigits = newValue.replace('.', '');
        if (totalDigits.length > 11) {
            return false;
        }

        // Validasi fraction digits (setelah titik)
        if (newValue.includes('.')) {
            var parts = newValue.split('.');
            if (parts[1].length > 10) {
                return false;
            }
        }

        return true;
    }

    return false;
}



document.addEventListener("DOMContentLoaded", function () {
    const statusInput = document.getElementById("status"); // Ambil elemen status
    const form = document.getElementById("form1"); // Ambil elemen form

    if ((statusInput && statusInput.value === "OUT" && form)
        || (statusInput && statusInput.value === "INC" && form)
        || (statusInput && statusInput.value === "RESEND-CNF" && form)
        || (statusInput && statusInput.value === "AML-TERMINATE-IN" && form)
        || (statusInput && statusInput.value === "AML-FAILED" && form)
        || (statusInput && statusInput.value === "INC-AML-FAILED-CNF" && form)
        || (statusInput && statusInput.value === "UNSETTLE-INC" && form)
        || (statusInput && statusInput.value === "INC-RESEND-CNF" && form)
        || (statusInput && statusInput.value === "SETTLE" && form)
        || (statusInput && statusInput.value === "VER" && form) 
        || (statusInput && statusInput.value === "AUTH" && form)
        || (statusInput && statusInput.value === "FIA-FAILED" && form)
        || (statusInput && statusInput.value === "FIA-FAILED-CNF" && form)
        || (statusInput && statusInput.value === "UNSETTLE-OUT" && form)
        || (statusInput && statusInput.value === "WAITING-SAA-CNF" && form)
        || (statusInput && statusInput.value === "AML-TERMINATE-OUT" && form)
        || (statusInput && statusInput.value === "AML-FAILED-CNF" && form)
        || (statusInput && statusInput.value === "INC-CVT" && form)
        || (statusInput && statusInput.value === "CVT-VER" && form) 
        || (statusInput && statusInput.value === "WAITING-AML" && form) 
        || (statusInput && statusInput.value === "REJECT" && form) 
        || (statusInput && statusInput.value === "RESEND" && form)
        || (statusInput && statusInput.value === "ACK" && form)
        || (statusInput && statusInput.value === "NACK" && form)
        || (statusInput && statusInput.value === "DUPL-RESEND" && form)
        || (statusInput && statusInput.value === "INC-CVT-RESEND" && form)
        || (statusInput && statusInput.value === "INC-AML-RESEND" && form)
        || (statusInput && statusInput.value === "INC-RESEND" && form)
        || (statusInput && statusInput.value === "CVT-VER-RESEND" && form)
        || (statusInput && statusInput.value === "DDA-RESEND" && form)
        || (statusInput && statusInput.value === "REM-RESEND" && form)
        || (statusInput && statusInput.value === "INTEL-RESEND" && form)
        || (statusInput && statusInput.value === "WAITING-SAA-RESEND" && form)
        || (statusInput && statusInput.value === "AML-RESEND" && form)
        || (statusInput && statusInput.value === "FIA-RESEND" && form)) {
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
    const instrid = document.getElementById('instrid');
    const msgid = document.getElementById('msgid');
    msgid.value = instrid.value;
}

function copyToMsgId004() {
    const rtrid = document.getElementById('rtrid');
    const msgid = document.getElementById('msgid');
    msgid.value = rtrid.value;
}