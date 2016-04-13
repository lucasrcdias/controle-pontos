Module('App.Filter', function (Filter) {
  Filter.fn.initialize = function () {
    this.$filterToggle  = $('.js-filter-toggle');
    this.$filterWrapper = $('.js-filter-wrapper');

    this.$filterToggle.on('click', $.proxy(this.toggleFilter, this));
  };

  Filter.fn.toggleFilter = function (event) {
    event.preventDefault();
    this.$filterWrapper.slideToggle();
  };
});
