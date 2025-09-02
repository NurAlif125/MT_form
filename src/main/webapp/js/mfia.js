function moveSelected(fromId, toId) {
    const from = document.getElementById(fromId);
    const to = document.getElementById(toId);
    Array.from(from.selectedOptions).forEach(option => {
        to.appendChild(option);
    });
    prepareSubmission();
}

function moveAll(fromId, toId) {
    const from = document.getElementById(fromId);
    const to = document.getElementById(toId);
    Array.from(from.options).forEach(option => {
        to.appendChild(option);
    });
    prepareSubmission();
}

function prepareSubmission() {
    const target = document.getElementById('targetSourceTo');
    const selected = Array.from(target.options).map(opt => opt.value);
    document.getElementById('selectedValuesSourceTo').value = selected.join(',');
}