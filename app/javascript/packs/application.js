// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.


require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
import "bootstrap";
import "../stylesheets/application";
import "../stylesheets/custom";

$(function () {
  $(window).on('scroll', function () {
    if ($(window).scrollTop() > 10) {
      $('.navbar').addClass('bg-gradient shadow-sm');
    } else {
      $('.navbar').removeClass('bg-gradient shadow-sm');
    }
  });
});