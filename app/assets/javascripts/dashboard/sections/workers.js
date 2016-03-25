Module('Application.DashboardWorkers', function (Workers) {
  Workers.fn.initialize = function () {
    this.$workerKind    = $('span.radio input');
    this.$documentField = $('.js-document-field');
    this.$filterToggle  = $('.js-filter-toggle');
    this.$filterWrapper = $('.js-filter-wrapper');
    this.$workerKinds   = { 0: 'cpf', 1: 'cnpj' };

    this.$workerKind.on('change', $.proxy(this.toggleWorkerKind, this));
    this.$filterToggle.on('click', $.proxy(this.toggleFilter, this));
  };

  Workers.fn.toggleWorkerKind = function () {
    var checked  = this.$workerKind.filter(':checked');
    var maskType = this.$workerKinds[checked.val()];

    this.$documentField.setMask(maskType);
  };

  Workers.fn.toggleFilter = function (event) {
    event.preventDefault();
    this.$filterWrapper.slideToggle();
  };
});
