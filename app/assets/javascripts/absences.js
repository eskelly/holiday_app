$(document).ready(function() {
  $.fn.datepicker.defaults.format = "dd/mm/yyyy";
  $('#absence_date_from').datepicker();
  $('#absence_date_to').datepicker();
});