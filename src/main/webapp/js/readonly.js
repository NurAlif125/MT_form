$(document).ready(() => {
  $("#form1").find('input, textarea').prop('readonly', true);
  $("#form1").find('select').on('mousedown', e => e.preventDefault());
  $("#form1").find('.hasDatepicker').datepicker("destroy");
});