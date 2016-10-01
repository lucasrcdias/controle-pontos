Module('App.Tooltip', function (Tooltip) {
  Tooltip.fn.initialize = function () {
    $('[data-toggle="tooltip"]').tooltip();
  };
});
