Module('App.InputMask', function (InputMask) {
  InputMask.fn.initialize = function () {
    $('input[data-mask]').each(function() {
      var element = $(this);
      var maskType = element.data("mask");

      element.setMask(maskType);
    });
  };
});
