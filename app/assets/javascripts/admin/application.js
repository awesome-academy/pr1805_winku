//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require ./lib/perfect-scrollbar.jquery.min.js
//= require ./lib/sparkline.js
//= require ./lib/waves.js
//= require ./lib/sidebarmenu.js
//= require ./lib/custom.min.js
//= require ./lib/excanvas.js
//= require ./lib/jquery.flot.js
//= require ./lib/jquery.flot.pie.js
//= require ./lib/jquery.flot.time.js
//= require ./lib/jquery.flot.stack.js
//= require ./lib/jquery.flot.crosshair.js
//= require ./lib/jquery.flot.tooltip.min.js
//= require ./lib/jquery.multicheck.js
//= require ./lib/chart-page-init.js
//= require ./lib/datatable-checkbox-init.js
//= require ./lib/datatables.min.js
$(document).on("change", "select#sel1", function(){
  var role = $(this).val();
  $.ajax({
    url: $(this).closest("div").closest("form").attr("action"),
    method: "PATCH",
    dataType: "json",
    data: {role: role},
    error: function (xhr, status, error) {
      console.error('AJAX Error: ' + status + error);
    },
    success: function (response) {
      console.log(response);
    }
  });
});
