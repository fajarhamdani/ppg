$(document).on('turbolinks:load', function() {
  $('#dataTable').DataTable({
    "pagingType": "full_numbers"
  });
});