//= require jquery/dist/jquery
//= require jquery-ujs/src/rails
//= require bootstrap-sass-official/assets/javascripts/bootstrap
//= require module/module
//= require dispatcher
//= require jquery-meiomask/dist/meiomask
//= require_tree ./modules
//= require_tree ./dashboard/sections

Module.run('App.InputMask');
Module.run('App.Filter');

$("[data-toggle='tooltip']").tooltip();
