

function formatUang(n, currency) {
    if (isNaN(n)) {
        return "";
    }
    return currency + " " + n.toFixed(2).replace(/(\d)(?=(\d{3})+\.)/g, "$1,");
}


function tampilkanNominal(elementId, fontSize = 2, color = "blue") {
    const el = document.getElementById(elementId);
    if (!el) return;

    const numberStr = el.value.replace(',', '.') || "";
    const number = parseFloat(numberStr);

    const nominal = formatUang(number, "");
    if (nominal && nominal.trim() !== "") {
        const span = document.createElement("span");
        span.style.fontSize = fontSize + "em";
        span.style.color = color;
        span.textContent = nominal;

        el.insertAdjacentElement("afterend", span);
    }
}


const inputCurrencyStyle = [
    { id: "_062_mf32a_amount", size: 2 },
    { id: "_072_of33b_amount", size: 2 },
    { id: "_221_of71f_amount", size: 2 },
    { id: "_223_of71f_amount", size: 2 },
    { id: "_225_of71f_amount", size: 2 },
    { id: "_227_of71f_amount", size: 2 },
    { id: "_229_of71f_amount", size: 2 },
    { id: "_231_of71g_amount", size: 2 },
    { id: "_332_of33b_amount", size: 2 }
];

inputCurrencyStyle.forEach(item => tampilkanNominal(item.id, item.size));

