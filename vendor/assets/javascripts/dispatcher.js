;(function ($) {
  'use strict';

  this.App = this.App || {};

  var Dispatcher = function () {
    var page = $('body').data('route').split('#');

    this.controller = page[0];
    this.action     = Dispatcher.ALIASES[page[1]] || page[1];

    this.run();
  };

  Dispatcher.ALIASES = {
    'create': 'new',
    'update': 'edit',
    'destroy': 'remove'
  };

  Dispatcher.prototype.run = function () {
    Module.run('Application.Common');
    Module.run('Application.' + this.controller);
  };

  $(document).on('ready', function () {
    new Dispatcher();
  });
}).call(this, jQuery);
