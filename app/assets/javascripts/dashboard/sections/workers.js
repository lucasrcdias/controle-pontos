Module('Application.DashboardWorkers', function (Workers) {
  Workers.fn.initialize = function () {
    this.$workerKind    = $('span.radio input');
    this.$documentField = $('.js-document-field');
    this.$workerKinds   = { 0: 'cpf', 1: 'cnpj' };

    this.$workerKind.on('change', $.proxy(this.toggleWorkerKind, this));
  };

  Workers.fn.toggleWorkerKind = function () {
    var checked  = this.$workerKind.filter(':checked');
    var maskType = this.$workerKinds[checked.val()];

    this.$documentField.setMask(maskType);
  };
});
