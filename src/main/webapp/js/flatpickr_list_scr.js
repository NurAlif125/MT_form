/* 
 * Click to change this license
 * Click to edit this template
 */

flatpickr(".time_from", {
    enableTime: true,
    enableSeconds: true,
    noCalendar: true,
    dateFormat: "H:i:S",
    time_24hr: true,
    defaultDate: "00:00:00"
});
flatpickr(".time_end", {
    enableTime: true,
    enableSeconds: true,
    noCalendar: true,
    dateFormat: "H:i:S",
    time_24hr: true,
    defaultDate: "23:59:59"
});